import 'dart:convert';

import 'package:flutter/material.dart';

/// Customer Metadata, this contains the customer's information.
class CustomerMetadata {
  //Decalration of variables.

  /// This is the name of your user.
  String name;

  /// This is the email of the user.
  String email;

  /// This is an external ID of the user.
  String externalId;

  /// Any extra data you want to pass can be passed as a key-value pair.
  Map<String, String> otherMetadata;

  //Class definition.
  CustomerMetadata({
    this.email,
    this.externalId,
    this.name,
    this.otherMetadata,
  });

  /// This transforms the object into a JSON string wihich will
  /// be passed onto the URI.
  String toJsonString() {
    return json.encode(
      {
        "name": this.name,
        "email": this.email,
        "external_id": this.externalId,
        // This will spread the custom metadata
        ...this.otherMetadata,
      },
    );
  }
}

/// This contains all the possible configurations for the chat widget.
class Props {
  //Decalration of variables.

  /// This is the top section of the widget, normally a welcome text.
  String title;

  /// This is a smaller piece of text under the title.
  String subtitle;

  /// Color in which the header is going to be in, if not defined will be primary color used in app.
  Color primaryColor;

  /// Required to create the wig¡dget, identifies the account.
  String accountId;

  /// If you are self-hosting papercups, this base URL should be changed.
  String baseUrl;

  /// This is the first message sent by you during the conversation.
  String greeting;

  /// This is the data that you will see on your dashboard such as the email or the name of the person.
  CustomerMetadata customer;

  /// This is the placeholder text in the input section.
  String newMessagePlaceholder;

  /// This text will be shown if the showAgentAvailability is true and you are online.
  String agentAvailableText;

  /// This text will be shown if the showAgentAvailability is true and you are offline.
  String agentUnavailableText;

  /// This allows you to choose if you want to show your status.
  bool showAgentAvailability;

  /// This Will allow you to require an emial to chat. Not recommended for an app.
  bool requireEmailUpfront;

  /// Wether to allow scrolling.
  bool scrollEnabled;

  //Class definition.
  Props({
    @required this.accountId,
    this.agentAvailableText,
    this.agentUnavailableText,
    this.baseUrl,
    this.customer,
    this.greeting,
    this.newMessagePlaceholder,
    this.primaryColor,
    this.requireEmailUpfront = false,
    this.scrollEnabled = false,
    this.showAgentAvailability = false,
    this.subtitle,
    this.title,
  });

  /// This function will convert the data stored in the object into a map.
  /// Used for transorming into the URI
  Map<String, String> toMap() {
    return {
      "accountId": this.accountId,
      "agentAvailableText": this.agentAvailableText,
      "agentUnavailableText": this.agentUnavailableText,
      "baseUrl": this.baseUrl,
      "metadata": this.customer.toJsonString(),
      "greeting": this.greeting,
      "newMessagePlaceholder": this.newMessagePlaceholder,
      "primaryColor": "#" +
          this
              .primaryColor
              .withAlpha(255)
              .value
              .toRadixString(16)
              .substring(2)
              .toUpperCase(),
      "requireEmailUpfront": this.requireEmailUpfront ? "1" : "0",
      "scrollEnabled": this.scrollEnabled ? "1" : "0",
      "showAgentAvailability": this.showAgentAvailability ? "1" : "0",
      "subtitle": this.subtitle,
      "title": this.title,
    };
  }
}
