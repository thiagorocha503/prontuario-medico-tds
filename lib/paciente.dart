
class Paciente {
    String _nome;
    int _idade;
    String _sexo;
    DateTime _data;
    String _sintomas;

    Paciente(this._nome, this._idade, this._sexo, this._data, this._sintomas);

    /*
     * Construtor 
     * 
     * Retorna um instância a partir de Map json
     **/
    Paciente.fromJson(Map<String, dynamic> json){
        this._nome = json["nome"];
        this._idade = json["idade"];
        this._sexo = json["sexo"];
        this._data =  DateTime.tryParse(json["data"]);
        this._sintomas = json["sintomas"];
    }
    
   /*
    * 
    * Retorna um map da instãncia 
    **/
    Map<String, dynamic> toJson(){
        return {
                "nome": this._nome,
                "idade": this._idade,
                "sexo": this._sexo,
                "data": this._data,
                "sintomas": this._sintomas
               };
    }
    
    /*============Getters e setters=================== */
    String getNome() {
        return this._nome;
    }

    void setNome(String nome) {
        this._nome = nome;
    }
    
    int getIdade() {
        return this._idade;
    }

    void setIdade(int idade) {
        this._idade = idade;
    }

    String getSexo() {
        return this._sexo;
    }

    void setSexo(String sexo) {
        this._sexo = sexo;
    }

    DateTime getData() {
        return this._data;
    }

    void setData(DateTime data) {
        this._data = data;
    }

    String getSintomas() {
        return this._sintomas;
    }

    void setSintomas(String sintomas) {
        this._sintomas = sintomas;
    }

    String toString() {
        return "nome: ${this._nome}, idade: ${this._idade}, sexo: ${this._sexo}, data: ${this._data.toString()}, sintomas: ${this._sintomas}";
    }
}