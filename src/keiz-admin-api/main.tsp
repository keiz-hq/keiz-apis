import "@typespec/http";
import "@typespec/openapi";
import "../foundation";
import "../keiz-foundation";
import "./models";

using Http;
using OpenAPI;
using Foundation;
using KeizFoundation;

@service(#{ title: "Keiz! Admin API" })
@info(#{
  version: "1.0.0",
  contact: #{
    name: "Keiz!",
    url: "https://ag-keiz.com",
    email: "hq@ag-keiz.com",
  },
  license: #{
    name: "Copyright © 2026 Keiz! Co., Ltd. All rights reserved.",
    url: "https://ag-keiz.com",
  },
})
@server("https://api.admin.ag-keiz.com", "Production")
@server("https://stg.api.admin.ag-keiz.com", "Staging")
@server("https://dev.api.admin.ag-keiz.com", "Development")
@server("http://localhost:8080", "Local")
@useAuth(BearerAuth)
namespace KeizAdminAPI {
  @route("/cars")
  @tag("Cars")
  interface Cars {
    @get list(@query filter?: "lined_up" | "recommended"): OkResponse &
      Body<{
        cars: Car[];
      }>;

    @get detail(@path carId: uuid): OkResponse &
      Body<{
        car: Car;
      }>;

    @post create(@body body: CreateCar): CreatedResponse &
      Body<{
        car: Car;
      }>;

    @patch(#{ implicitOptionality: true }) update(
      @path carId: uuid,
      @body body: UpdateCar,
    ): OkResponse &
      Body<{
        car: Car;
      }>;

    @delete delete(@path carId: uuid): NoContentResponse;
  }

  @route("/cars/{carId}/sold")
  @tag("Cars")
  interface Sold {
    @patch(#{ implicitOptionality: true }) sold(
      @path carId: uuid,
      @query sold: boolean,
    ): OkResponse &
      Body<{
        car: Car;
      }>;
  }

  @route("/cars/{carId}/images")
  @tag("Images")
  interface Images {
    @get list(@path carId: uuid): OkResponse &
      Body<{
        images: Image[];
      }>;

    @get detail(@path carId: uuid, @path imageId: uuid): OkResponse &
      Body<{
        image: Image;
      }>;

    @post
    create(@path carId: uuid, @body body: CreateImagePayload): CreatedResponse &
      Body<{
        image: Image;
      }>;

    @patch(#{ implicitOptionality: true }) update(
      @path carId: uuid,
      @path imageId: uuid,
      @body body: UpdateImagePayload,
    ): OkResponse &
      Body<{
        image: Image;
      }>;

    @delete delete(@path carId: uuid, @path imageId: uuid): NoContentResponse;
  }

  @route("/cars/{carId}/prices")
  @tag("Prices")
  interface Prices {
    @get list(@path carId: uuid): OkResponse &
      Body<{
        prices: Price[];
      }>;

    @get detail(@path carId: uuid, @path priceId: uuid): OkResponse &
      Body<{
        price: Price;
      }>;

    @post
    create(@path carId: uuid, @body body: CreatePricePayload): CreatedResponse &
      Body<{
        price: Price;
      }>;

    @patch(#{ implicitOptionality: true }) update(
      @path carId: uuid,
      @path priceId: uuid,
      @body body: UpdatePricePayload,
    ): OkResponse &
      Body<{
        price: Price;
      }>;

    @delete delete(@path carId: uuid, @path priceId: uuid): NoContentResponse;
  }

  @route("/attributes")
  @tag("Attributes")
  interface Attributes {
    @get list(): OkResponse &
      Body<{
        attributes: Attribute[];
      }>;

    @get detail(@path attributeId: uuid): OkResponse &
      Body<{
        attribute: Attribute;
      }>;

    @post
    create(@body body: CreateAttributePayload): CreatedResponse &
      Body<{
        attribute: Attribute;
      }>;

    @patch(#{ implicitOptionality: true }) update(
      @path attributeId: uuid,
      @body body: UpdateAttributePayload,
    ): OkResponse &
      Body<{
        attribute: Attribute;
      }>;

    @delete delete(@path attributeId: uuid): NoContentResponse;
  }

  @route("/attributes/{attributeId}/choices")
  @tag("Choices")
  interface Choices {
    @get list(@path attributeId: uuid): OkResponse &
      Body<{
        choices: Choice[];
      }>;

    @get detail(@path attributeId: uuid, @path choiceId: uuid): OkResponse &
      Body<{
        choice: Choice;
      }>;

    @post
    create(
      @path attributeId: uuid,
      @body body: CreateChoicePayload,
    ): CreatedResponse &
      Body<{
        choice: Choice;
      }>;

    @patch(#{ implicitOptionality: true }) update(
      @path attributeId: uuid,
      @path choiceId: uuid,
      @body body: UpdateChoicePayload,
    ): OkResponse &
      Body<{
        choice: Choice;
      }>;

    @delete delete(
      @path attributeId: uuid,
      @path choiceId: uuid,
    ): NoContentResponse;
  }
}
