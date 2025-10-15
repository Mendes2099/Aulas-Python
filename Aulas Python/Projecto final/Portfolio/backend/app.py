# backend/app.py
import os
from flask import Flask, request, jsonify
from flask_cors import CORS
from dotenv import load_dotenv
import sqlite3
import smtplib
from email.mime.text import MIMEText

load_dotenv()  # loads .env in backend/

app = Flask(__name__)
CORS(app, resources={r"/api/*": {"origins": os.getenv("FRONTEND_ORIGIN", "*")}})

DB_PATH = os.getenv("DB_PATH", "contacts.db")

def save_to_db(data):
    with sqlite3.connect(DB_PATH) as conn:
        cur = conn.cursor()
        cur.execute("""
            CREATE TABLE IF NOT EXISTS contacts (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                name TEXT, email TEXT, subject TEXT, message TEXT,
                created_at DATETIME DEFAULT CURRENT_TIMESTAMP
            )
        """)
        cur.execute("INSERT INTO contacts (name, email, subject, message) VALUES (?, ?, ?, ?)",
                    (data["name"], data["email"], data["subject"], data["message"]))
        conn.commit()

def send_email(data):
    # Example: using Gmail SMTP + App Password (preferred)
    smtp_server = os.getenv("SMTP_SERVER", "smtp.gmail.com")
    smtp_port = int(os.getenv("SMTP_PORT", 587))
    smtp_user = os.getenv("SMTP_USER")
    smtp_pass = os.getenv("SMTP_PASS")
    if not smtp_user or not smtp_pass:
        raise RuntimeError("SMTP credentials not set in env")
    body = f"From: {data['name']} <{data['email']}>\n\n{data['message']}"
    msg = MIMEText(body)
    msg["Subject"] = f"Website Contact: {data['subject']}"
    msg["From"] = smtp_user
    msg["To"] = smtp_user

    s = smtplib.SMTP(smtp_server, smtp_port)
    s.starttls()
    s.login(smtp_user, smtp_pass)
    s.sendmail(smtp_user, [smtp_user], msg.as_string())
    s.quit()

@app.route("/api/contact", methods=["POST"])
def contact():
    data = request.get_json() or {}
    required = ["name", "email", "subject", "message"]
    if not all(k in data and data[k].strip() for k in required):
        return jsonify({"status": "error", "message": "Missing fields"}), 400

    try:
        # Save to DB (optional)
        save_to_db(data)

        # Optionally send email (wrap in try/except if you want to ignore failures)
        if os.getenv("ENABLE_EMAIL", "false").lower() == "true":
            send_email(data)

        return jsonify({"status": "success", "message": "Message received"})
    except Exception as e:
        print("Backend error:", e)
        return jsonify({"status": "error", "message": "Internal server error"}), 500

if __name__ == "__main__":
    app.run(port=int(os.getenv("PORT", 5000)), debug=True)
