class CatBreedsWeight {
    final String imperial;
    final String metric;

    CatBreedsWeight({
        required this.imperial,
        required this.metric,
    });

    factory CatBreedsWeight.fromJson(Map<String, dynamic> json) => CatBreedsWeight(
        imperial: json["imperial"],
        metric: json["metric"],
    );

    Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
    };
}