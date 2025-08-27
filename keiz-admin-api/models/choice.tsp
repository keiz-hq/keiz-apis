model Choice {
  id: uuid;
  name: string;
}

model CreateChoicePayload {
  name: string;
}

model UpdateChoicePayload {
  name?: string;
}
