from flask import Flask, jsonify, request
from flask_cors import CORS
import pandas as pd
app = Flask(__name__)
CORS(app, resources={r"/*": {"origins": "*"}})
def makeValidOperator(operator):
    operatorDataDict = {}
    listKeysDataDict = ["razao_social", "logradouro", "numero", "bairro", "cidade","uf", "ddd", "telefone", "endereco_eletronico"]
    operatorKeys = ['Razao_Social', 'Logradouro', 'Numero', 'Bairro', 'Cidade', 'UF', 'DDD','Telefone', 'Endereco_eletronico']
    i = 0
    while(i<len(listKeysDataDict)):
        if listKeysDataDict[i] == "ddd" or listKeysDataDict[i] == "telefone":
            operatorDataDict[listKeysDataDict[i]] = operator.get(operatorKeys[i]) if operator.get(operatorKeys[i]) > 0 else ""
        elif listKeysDataDict[i] == "endereco_eletronico":
            if type(operator.get(operatorKeys[i])) is float:
                operatorDataDict[listKeysDataDict[i]] = ""
            else:
                operatorDataDict[listKeysDataDict[i]] = operator.get(operatorKeys[i])
        else:
            operatorDataDict[listKeysDataDict[i]] = operator.get(operatorKeys[i])
        i += 1

    return operatorDataDict

@app.route("/api/operadoras", methods=["POST"])
def healthOperators():
    data = request.json
    textRequest = data.get("text")
    df = pd.read_csv(
        'relatorio_cadop.csv',
        sep=';',
        header=0,
        usecols=['Razao_Social', 'Logradouro', 'Numero', 'Bairro', 'Cidade', 'UF', 'DDD','Telefone', 'Endereco_eletronico'],
        encoding='utf-8'
    )
    operatorsRows = df.to_dict(orient='records')
    operatorsList = [operatorRow for operatorRow in operatorsRows if textRequest.upper() in operatorRow.get("Razao_Social").upper()]
    responseData = [makeValidOperator(operator) for operator in operatorsList]
    return jsonify({"received_data": responseData}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)