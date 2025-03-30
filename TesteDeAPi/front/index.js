async function fecthOperators(text){
    const data = {
        text: text,
    }
    const options = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(data)
    };
    let response = await fetch("http://localhost:5000/api/operadoras", options)
    return await response.json();
}

const app = new Vue({
    el: '#app',
    data: {
        operators: []
    },
    methods: {
        searchOperators: function (event) {
            fecthOperators(event.target.value).then(data => {
                this.operators = data.received_data
            });
        }
    }

});
