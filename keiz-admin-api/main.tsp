import "@typespec/http";
import "@typespec/openapi";
import "@typespec/openapi3";
import "./models.tsp";

using Http;
using OpenAPI;

@service(#{ title: "Keiz! Admin API" })
@info(#{
  version: "1.0.0",
  contact: #{
    name: "Keiz!",
    url: "https://ag-keiz.com",
    email: "hq@ag-keiz.com",
  },
  license: #{ name: "All Rights Reserved", url: "https://ag-keiz.com" },
})
namespace KeizAdminAPI;

/**
 * Get cars
 */
@tag("car")
@route("/cars")
@get
@summary("Get Cars")
op getCars(
  /**
   * Filter
   */
  @query(#{ explode: true }) filter?: "lined_up" | "recommended",
): Body<Car[]> | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Create a car
 */
@tag("car")
@route("/cars")
@post
@summary("Create Car")
op createCar(@body body: CreateCar): (CreatedResponse &
  Car) | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Delete a car
 */
@tag("car")
@route("/cars/{carId}")
@delete
@summary("Delete Car")
op deleteCar(...Parameters.carId):
  | NoContentResponse
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get a car
 */
@tag("car")
@route("/cars/{carId}")
@get
@summary("Get Car")
op getCar(...Parameters.carId):
  | Car
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Update a car
 */
@tag("car")
@route("/cars/{carId}")
@patch
@summary("Update Car")
op updateCar(...Parameters.carId, @body body: UpdateCar):
  | Car
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get images
 */
@tag("image")
@route("/cars/{carId}/images")
@get
@summary("Get Images")
op getImages(...Parameters.carId): Body<Image[]> | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Create a image
 */
@tag("image")
@route("/cars/{carId}/images")
@post
@summary("Create Image")
op createImage(...Parameters.carId, @body body: CreateImage): (CreatedResponse &
  Image) | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Delete a image
 */
@tag("image")
@route("/cars/{carId}/images/{imageId}")
@delete
@summary("Delete Image")
op deleteImage(...Parameters.carId, ...Parameters.imageId):
  | NoContentResponse
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get a image
 */
@tag("image")
@route("/cars/{carId}/images/{imageId}")
@get
@summary("Get Image")
op getImage(...Parameters.carId, ...Parameters.imageId):
  | Image
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Update a image
 */
@tag("image")
@route("/cars/{carId}/images/{imageId}")
@patch
@summary("Update Image")
op updateImage(
  ...Parameters.carId,
  ...Parameters.imageId,
  @body body: UpdateImage,
):
  | Image
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get prices
 */
@tag("price")
@route("/cars/{carId}/prices")
@get
@summary("Get Pricess")
op getPrices(...Parameters.carId): Body<Price[]> | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Create a price
 */
@tag("price")
@route("/cars/{carId}/prices")
@post
@summary("Create Price")
op createPrice(...Parameters.carId, @body body: CreatePrice): (CreatedResponse &
  Price) | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Delete a price
 */
@tag("price")
@route("/cars/{carId}/prices/{priceId}")
@delete
@summary("Delete Price")
op deletePrice(...Parameters.carId, ...Parameters.priceId):
  | NoContentResponse
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get a price
 */
@tag("price")
@route("/cars/{carId}/prices/{priceId}")
@get
@summary("Get Price")
op getPrice(...Parameters.carId, ...Parameters.priceId):
  | Price
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Update a price
 */
@tag("price")
@route("/cars/{carId}/prices/{priceId}")
@patch
@summary("Update Price")
op updatePrice(
  ...Parameters.carId,
  ...Parameters.priceId,
  @body body: UpdatePrice,
):
  | Price
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get attributes
 */
@tag("attribute")
@route("/attributes")
@get
@summary("Get Attribute")
op getAttributes(): Body<Attribute[]> | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Create an attributes
 */
@tag("attribute")
@route("/attributes")
@post
@summary("Create Attribute")
op createAttribute(@body body: CreateAttribute): (CreatedResponse &
  Attribute) | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Delete an attribute
 */
@tag("attribute")
@route("/attributes/{attributeId}")
@delete
@summary("Delete Attribute")
op deleteAttribute(...Parameters.attributeId):
  | NoContentResponse
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get an attribute
 */
@tag("attribute")
@route("/attributes/{attributeId}")
@get
@summary("Get Attribute")
op getAttribute(...Parameters.attributeId):
  | Attribute
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Update an attribute
 */
@tag("attribute")
@route("/attributes/{attributeId}")
@patch
@summary("Update Attribute")
op updateAttribute(...Parameters.attributeId, @body body: UpdateAttribute):
  | Attribute
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get attribute choices
 */
@tag("attribute_choice")
@route("/attributes/{attributeId}/choices")
@get
@summary("Get Attribute Choices")
op getAttributeChoices(
  ...Parameters.attributeId,
): Body<AttributeChoice[]> | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Create an attribute choice
 */
@tag("attribute_choice")
@route("/attributes/{attributeId}/choices")
@post
@summary("Create Attribute Choice")
op createAttributeChoice(
  ...Parameters.attributeId,
  @body body: CreateAttributeChoice,
): (CreatedResponse & AttributeChoice) | UnauthorizedResponse | {
  @statusCode statusCode: 500;
};

/**
 * Delete an attribute choice
 */
@tag("attribute_choice")
@route("/attributes/{attributeId}/choices/{choiceId}")
@delete
@summary("Delete Attribute Choice")
op deleteAttributeChoice(...Parameters.attributeId, ...Parameters.choiceId):
  | NoContentResponse
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Get an attribute choice
 */
@tag("attribute_choice")
@route("/attributes/{attributeId}/choices/{choiceId}")
@get
@summary("Get Attribute Choice")
op getAttributeChoice(...Parameters.attributeId, ...Parameters.choiceId):
  | AttributeChoice
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

/**
 * Update an attribute choice
 */
@tag("attribute_choice")
@route("/attributes/{attributeId}/choices/{choiceId}")
@patch
@summary("Update Attribute Choice")
op updateAttributeChoice(
  ...Parameters.attributeId,
  ...Parameters.choiceId,
  @body body: UpdateAttributeChoice,
):
  | AttributeChoice
  | UnauthorizedResponse
  | NotFoundResponse
  | {
      @statusCode statusCode: 500;
    };

namespace Parameters {
  model carId {
    /**
     * Car ID
     */
    @format("uuid") @path carId: string;
  }
  model imageId {
    /**
     * Image ID
     */
    @format("uuid") @path imageId: string;
  }
  model priceId {
    /**
     * Price ID
     */
    @format("uuid") @path priceId: string;
  }
  model attributeId {
    /**
     * Attribute ID
     */
    @format("uuid") @path attributeId: string;
  }
  model choiceId {
    /**
     * Choice ID
     */
    @format("uuid") @path choiceId: string;
  }
}
