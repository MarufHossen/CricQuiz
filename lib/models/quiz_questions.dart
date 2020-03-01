// To parse this JSON data, do
//
//     final quizQuestions = quizQuestionsFromJson(jsonString);

import 'dart:convert';

QuizQuestions quizQuestionsFromJson(String str) => QuizQuestions.fromJson(json.decode(str));

String quizQuestionsToJson(QuizQuestions data) => json.encode(data.toJson());

class QuizQuestions {
    List<Datum> data;

    QuizQuestions({
        this.data,
    });

    factory QuizQuestions.fromJson(Map<String, dynamic> json) => QuizQuestions(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String questionTitle;
    String questionAnswer;
    String questionLevel;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    int questionCategoryId;
    Media questionPhoto;
    QuestionCategory questionCategory;
    List<Media> media;

    Datum({
        this.id,
        this.questionTitle,
        this.questionAnswer,
        this.questionLevel,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.questionCategoryId,
        this.questionPhoto,
        this.questionCategory,
        this.media,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        questionTitle: json["question_title"],
        questionAnswer: json["question_answer"],
        questionLevel: json["question_level"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        questionCategoryId: json["question_category_id"],
        questionPhoto: json["question_photo"] == null ? null : Media.fromJson(json["question_photo"]),
        questionCategory: QuestionCategory.fromJson(json["question_category"]),
        media: List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question_title": questionTitle,
        "question_answer": questionAnswer,
        "question_level": questionLevel,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "question_category_id": questionCategoryId,
        "question_photo": questionPhoto == null ? null : questionPhoto.toJson(),
        "question_category": questionCategory.toJson(),
        "media": List<dynamic>.from(media.map((x) => x.toJson())),
    };
}

class Media {
    int id;
    String modelType;
    int modelId;
    String collectionName;
    String name;
    String fileName;
    String mimeType;
    String disk;
    int size;
    List<dynamic> manipulations;
    CustomProperties customProperties;
    List<dynamic> responsiveImages;
    int orderColumn;
    DateTime createdAt;
    DateTime updatedAt;
    String url;
    String thumbnail;

    Media({
        this.id,
        this.modelType,
        this.modelId,
        this.collectionName,
        this.name,
        this.fileName,
        this.mimeType,
        this.disk,
        this.size,
        this.manipulations,
        this.customProperties,
        this.responsiveImages,
        this.orderColumn,
        this.createdAt,
        this.updatedAt,
        this.url,
        this.thumbnail,
    });

    factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"],
        modelType: json["model_type"],
        modelId: json["model_id"],
        collectionName: json["collection_name"],
        name: json["name"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        disk: json["disk"],
        size: json["size"],
        manipulations: List<dynamic>.from(json["manipulations"].map((x) => x)),
        customProperties: CustomProperties.fromJson(json["custom_properties"]),
        responsiveImages: List<dynamic>.from(json["responsive_images"].map((x) => x)),
        orderColumn: json["order_column"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "model_type": modelType,
        "model_id": modelId,
        "collection_name": collectionName,
        "name": name,
        "file_name": fileName,
        "mime_type": mimeType,
        "disk": disk,
        "size": size,
        "manipulations": List<dynamic>.from(manipulations.map((x) => x)),
        "custom_properties": customProperties.toJson(),
        "responsive_images": List<dynamic>.from(responsiveImages.map((x) => x)),
        "order_column": orderColumn,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "url": url,
        "thumbnail": thumbnail,
    };
}

class CustomProperties {
    GeneratedConversions generatedConversions;

    CustomProperties({
        this.generatedConversions,
    });

    factory CustomProperties.fromJson(Map<String, dynamic> json) => CustomProperties(
        generatedConversions: GeneratedConversions.fromJson(json["generated_conversions"]),
    );

    Map<String, dynamic> toJson() => {
        "generated_conversions": generatedConversions.toJson(),
    };
}

class GeneratedConversions {
    bool thumb;

    GeneratedConversions({
        this.thumb,
    });

    factory GeneratedConversions.fromJson(Map<String, dynamic> json) => GeneratedConversions(
        thumb: json["thumb"],
    );

    Map<String, dynamic> toJson() => {
        "thumb": thumb,
    };
}

class QuestionCategory {
    int id;
    String categoryName;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;

    QuestionCategory({
        this.id,
        this.categoryName,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory QuestionCategory.fromJson(Map<String, dynamic> json) => QuestionCategory(
        id: json["id"],
        categoryName: json["category_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
    };
}
