import 'package:dart_openai/dart_openai.dart';

class Chat {
  Stream<OpenAIStreamChatCompletionModel> createChatStream(content) {
    Stream<OpenAIStreamChatCompletionModel> chatStream =
        OpenAI.instance.chat.createStream(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: content,
          role: OpenAIChatMessageRole.user,
        ),
      ],
      temperature: 0.6,
    );
    return chatStream;
  }

  Future<String> createChatCompletion(
    String content,
  ) async {
    OpenAIChatCompletionModel chatCompletion =
        await OpenAI.instance.chat.create(
      model: "gpt-3.5-turbo",
      messages: [
        OpenAIChatCompletionChoiceMessageModel(
          content: content,
          role: OpenAIChatMessageRole.user,
        ),
      ],
      temperature: 0.6,
    );
    return chatCompletion.choices.first.message.content;
  }

  String formatMessageContent({
    required List<String> listOfIngredients,
    int numberOfRecipes = 1,
    String strictnessLevel = "Use only these ingredients and kitchen staples.",
    String dietaryRestrictionsAndPreferences = "None",
    List<String> foodAllergies = const ["None"],
    List<String> recipesList = const [],
  }) {
    return """
    Create $numberOfRecipes recipes.
    $strictnessLevel: $listOfIngredients. 
    Take into account my dietary restrictions/preferences: $dietaryRestrictionsAndPreferences, and my food allergies: $foodAllergies.
    Do not create recipes similar to those in this list: $recipesList. 
    Begin each recipe with the tag <recipe> and end each recipe with the tag </recipe>. 
    Wrap the title of the recipe with the tags <title> and </title>. 
    Wrap the ingredients of the recipe with the tags <ingredients> and </ingredients>. 
    Wrap the instructions with the tags <instructions> and </instructions>. 
    Do not include any other formatting.""";
  }
}
