import "../../foundation";

using Foundation;

namespace KeizWebAPI {
  model Image {
    id: uuid;

    @doc("表示順序（1からスタート）")
    display_order: uint32;
  }
}
