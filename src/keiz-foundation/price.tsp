import "../foundation";

using Foundation;

namespace KeizFoundation {
  model Price {
    id: uuid;
    start_from: utcDateTime;
    body_price: uint32;
  }

  model CreatePricePayload {
    start_from: utcDateTime;
    body_price: uint32;
  }

  model UpdatePricePayload {
    start_from?: utcDateTime;
    body_price?: uint32;
  }
}
