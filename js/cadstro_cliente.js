async function cadastrar(){
    var form = document.getElementById("form-cadastro-cliente");
    var dados = new FormData(form);

    var promisse = await fetch("./php/cadstrocliente.php",{
        method: "POST",
        body: dados
    })

    var resposta = await promisse.json();
    console.log(resposta);


}

async function login_user() {
    var form = document.getElementById("form-login-user");
    var dados = new FormData(form);

    try {
        var promisse = await fetch("./php/loginuser.php", {
            method: "POST",
            body: dados
        });

        // Verifica se a resposta é OK (status 200)
        if (!promisse.ok) {
            throw new Error('Network response was not ok: ' + promisse.status);
        }

        // Tenta converter a resposta para JSON
        var resposta = await promisse.json();
        console.log(resposta);
        
    } catch (error) {
        console.error("Houve um problema com a requisição:", error);
    }
}
