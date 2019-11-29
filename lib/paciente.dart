
class Paciente {
    String _nome;
    int _idade;
    String _sexo;
    DateTime _data;
    String _sintomas;

    Paciente(this._nome, this._idade, this._sexo, this._data, this._sintomas);

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

    Map toMap(){
        return {"nome":this._nome,
                "idade":this._idade,
                "sexo": this._sexo,
                "data":this._data.toString(),
                "sintomas":this._sintomas
        };
    }

    String toString() {
        return "nome: ${this._nome}, idade: ${this._idade}, sexo: ${this._sexo}, data: ${this._data.toString()}, sintomas: ${this._sintomas}";
    }
}