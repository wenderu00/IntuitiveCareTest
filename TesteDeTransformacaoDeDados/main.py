import os
import zipfile

import tabula
import pandas as pd

odName = "Seg. Odontológica".upper()
ambName = "Seg. Ambulatorial".upper()

pdfName = "Anexo_I_Rol_2021RN_465.2021_RN627L.2024.pdf"
pdfPath = os.path.join(os.path.dirname(__file__),"docs", pdfName)
tables = tabula.read_pdf(pdfPath, pages="3-181", multiple_tables=True, lattice=True)
tables_final = pd.concat(tables).rename(columns={"OD": odName, "AMB": ambName})
tables_final.to_csv("tabela_final.csv", index=False, encoding="utf-8-sig")
with zipfile.ZipFile("Teste_Marcio_Wendell_M_C_Jr.zip", 'w',compression=zipfile.ZIP_DEFLATED) as zipf:
    if os.path.exists("tabela_final.csv"):
        zipf.write("tabela_final.csv")



