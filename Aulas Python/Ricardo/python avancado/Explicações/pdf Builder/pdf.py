from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle, PageBreak
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.enums import TA_CENTER, TA_LEFT
from reportlab.lib import colors

# Novo caminho para PDF com estilo atualizado e valores ajustados para júnior
pdf_path_junior = "/mnt/data/Apresentacao_Joao_Mendes_Junior_Perola_Humana.pdf"

doc = SimpleDocTemplate(pdf_path_junior, pagesize=A4)
styles = getSampleStyleSheet()

# Estilo visual mais leve e moderno
title_style = ParagraphStyle(
    name='TitleStyle', parent=styles['Title'], alignment=TA_CENTER, fontSize=22, textColor=colors.HexColor("#1F4E79"))
section_title_style = ParagraphStyle(
    name='SectionTitle', parent=styles['Heading2'], spaceBefore=18, fontSize=13, textColor=colors.HexColor("#1F4E79"))
normal_style = ParagraphStyle(
    name='NormalStyle', parent=styles['Normal'], fontSize=10.5, spaceAfter=8)
contact_style = ParagraphStyle(
    name='ContactStyle', parent=styles['Normal'], fontSize=10.5, spaceAfter=8, textColor=colors.HexColor("#1F4E79"))

table_style = TableStyle([
    ('BACKGROUND', (0, 0), (-1, 0), colors.HexColor("#D9E1F2")),
    ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
    ('ALIGN', (0, 0), (-1, -1), 'LEFT'),
    ('FONTNAME', (0, 0), (-1, -1), 'Helvetica'),
    ('FONTSIZE', (0, 0), (-1, -1), 9.5),
    ('BOTTOMPADDING', (0, 0), (-1, 0), 6),
    ('BACKGROUND', (0, 1), (-1, -1), colors.whitesmoke),
    ('GRID', (0, 0), (-1, -1), 0.25, colors.grey)
])

# Conteúdo
content = []

content.append(
    Paragraph("Apresentação Profissional - João Mendes", title_style))
content.append(Spacer(1, 10))

content.append(Paragraph("👨‍💻 Sobre Mim", section_title_style))
content.append(Paragraph(
    "Sou  um Software Developer com foco em soluções acessíveis e práticas para pequenos negócios. "
    "Trabalho com criação de sites, organização digital e suporte técnico.",
    normal_style))

content.append(
    Paragraph("💲 Tabela de Serviços e Preços (Agosto 2025)", section_title_style))
services_junior = [
    ["Serviço", "Valor (€)", "Descrição"],
    ["Configuração de domínio e e-mail profissional", "40 €",
        "Inclui suporte técnico básico e instruções"],
    ["Tradução do website", "120 €",
     "Site multilíngue com botão de idioma"],
    ["Criação de website institucional estático",
        "300 € – 450 €", "Site responsivo e publicado online"],
    ["Setup e organização de repositório GitHub", "30 €",
        "Repositório com estrutura básica e README"],
    ["Setup e organização de Notion", "30 €",
        "Quadro organizado com listas e etiquetas"],
    ["Documentação interna (Notion)", "35 €",
     "Página com histórico, instruções e links úteis"],
    ["Suporte técnico e manutenção mensal",
        "50 € / mês", "Até 4 horas de suporte remoto"],
    ["Consultoria digital variáda/ Formação", "15 € / hora",
        "Ajuda em ferramentas e organização online"]
]
content.append(Table(services_junior, style=table_style, hAlign='LEFT'))

content.append(Paragraph(
    "📈 Recomendações para Crescimento e Organização da Perola Humana", section_title_style))
recommendations = """
<ul>
<li><b>Website:</b> Criar site institucional multilíngue (PT/EN/FR) com presença clara online.</li>
<li><b>Identidade visual:</b> Confirmar logotipo e cores da marca com a equipa.</li>
<li><b>Organização:</b> Trello para tarefas e Notion para documentos e histórico técnico.</li>
<li><b>Colaboração técnica:</b> GitHub institucional para separar do uso pessoal.</li>
<li><b>Automatização:</b> Criar modelos e estrutura para comunicação via e-mail profissional.</li>
</ul>
"""
content.append(Paragraph(recommendations, normal_style))

content.append(Paragraph("📞 Contacto", section_title_style))
contact_info = """
<b>Nome:</b> João Mendes<br/>
<b>E-mail:</b> mendes19966@gmail.com<br/>
<b>WhatsApp / Telefone:</b> +351 915474777<br/>
<b>Portfólio:</b> <a href='https://mendes2099.github.io/Personal-Website/'>mendes2099.github.io</a>
"""
content.append(Paragraph(contact_info, contact_style))

# Construir PDF
doc.build(content)
pdf_path_junior
