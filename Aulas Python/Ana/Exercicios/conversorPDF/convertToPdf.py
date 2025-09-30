import os
from docx import Document
import pandas as pd
from PIL import Image
import fitz  # PyMuPDF

# Define input and output directories
input_dir = "input_files"
output_dir = "pdf_output"

# Check if input directory exists
if not os.path.exists(input_dir):
    print(f"Erro: A pasta '{input_dir}' não foi encontrada. Por favor, cria esta pasta e coloca os ficheiros a converter lá dentro.")
    exit(1)

# Create output directory if it doesn't exist
os.makedirs(output_dir, exist_ok=True)

# Iterate through all files in the input directory
for filename in os.listdir(input_dir):
    input_path = os.path.join(input_dir, filename)
    name, ext = os.path.splitext(filename)
    ext = ext.lower()

    output_path = os.path.join(output_dir, f"{name}.pdf")

    try:
        if ext == ".docx":
            # Convert Word document to PDF
            doc = Document(input_path)
            pdf = fitz.open()
            page = pdf.new_page()
            text = "\n".join([para.text for para in doc.paragraphs])
            page.insert_text((72, 72), text)
            pdf.save(output_path)
            pdf.close()

        elif ext == ".xlsx":
            # Convert Excel file to PDF
            df = pd.read_excel(input_path, engine='openpyxl')
            pdf = fitz.open()
            page = pdf.new_page()
            text = df.to_string(index=False)
            page.insert_text((72, 72), text)
            pdf.save(output_path)
            pdf.close()

        elif ext == ".txt":
            # Convert text file to PDF
            with open(input_path, 'r', encoding='utf-8') as f:
                content = f.read()
            pdf = fitz.open()
            page = pdf.new_page()
            page.insert_text((72, 72), content)
            pdf.save(output_path)
            pdf.close()

        elif ext in [".png", ".jpg", ".jpeg"]:
            # Convert image to PDF
            image = Image.open(input_path)
            image.convert("RGB").save(output_path, "PDF")

    except Exception as e:
        print(f"Erro ao converter '{filename}': {e}")

print("Conversão concluída. Os PDFs foram guardados na pasta 'pdf_output'.")