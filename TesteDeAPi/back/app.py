from flask import Flask, jsonify, request
import pandas as pd
app = Flask(__name__)

@app.route("/api/operadoras", methods=["POST"])
def healthOperators():
    data = request.json
    textRequest = data.get("text")
    df = pd.read_csv(
        'relatorio_cadop.csv',
        sep=';',
        header=0,
        usecols=['Razao_Social', 'Logradouro', 'Numero', 'Bairro', 'Cidade', 'UF'],
        encoding='utf-8',
        na_values=['N/A']
    )
    operatorsRows = df.to_dict(orient='records')
    operatorsList = [operatorRow for operatorRow in operatorsRows if textRequest.upper() in operatorRow.get("Razao_Social").upper()]
    responseData = [{
        "uf": operator.get("UF"),
        "cidade": operator.get("Cidade"),
        "bairro": operator.get("Bairro"),
        "logradouro": operator.get("Logradouro"),
        "numero": operator.get("Numero")
    } for operator in operatorsList]

    return jsonify({"received_data": responseData}), 201

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)