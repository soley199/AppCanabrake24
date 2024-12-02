import 'dart:convert';

class ResponseCana {
    int id;
    String distribuidor;
    String direccion;
    String? refeEmpresa;
    String? referencia;
    String refeEmail;
    String refeNumero;
    dynamic refeSecu;
    String? refeSecuEmail;
    String? refeSecuNumero;

    ResponseCana({
        required this.id,
        required this.distribuidor,
        required this.direccion,
        required this.refeEmpresa,
        required this.referencia,
        required this.refeEmail,
        required this.refeNumero,
        required this.refeSecu,
        required this.refeSecuEmail,
        required this.refeSecuNumero,
    });

    factory ResponseCana.fromJson(String str) => ResponseCana.fromMap(json.decode(str));

    factory ResponseCana.fromMap(Map<String, dynamic> json) => ResponseCana(
        id: json["id"],
        distribuidor: json["distribuidor"],
        direccion: json["direccion"],
        refeEmpresa: json["RefeEmpresa"],
        referencia: json["Referencia"],
        refeEmail: json["RefeEmail"],
        refeNumero: json["RefeNumero"],
        refeSecu: json["RefeSecu"],
        refeSecuEmail: json["RefeSecuEmail"],
        refeSecuNumero: json["RefeSecuNumero"],
    );
}


