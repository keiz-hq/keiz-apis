import "@typespec/http";
import "@typespec/openapi";
import "./models/afterService.tsp";
import "./models/attribute.tsp";
import "./models/car.tsp";
import "./models/choice.tsp";
import "./models/cost.tsp";
import "./models/image.tsp";
import "./models/metadata.tsp";
import "./models/price.tsp";
import "./models/registration.tsp";
import "./models/repairHistory.tsp";
import "./models/website.tsp";
import "./parameters.tsp";
import "./uuid.tsp";

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
  license: #{
    name: "Copyright © 2025 Keiz! Co., Ltd. All rights reserved.",
    url: "https://ag-keiz.com",
  },
})
@server("https://api.admin.ag-keiz.com", "Production")
@server("https://stg.api.admin.ag-keiz.com", "Staging")
@server("https://dev.api.admin.ag-keiz.com", "Development")
@server("http://localhost:8080", "Local")
@useAuth(BearerAuth)
namespace KeizAdminAPI;

@route("/cars")
namespace Cars {
  @get
  op list(
    @query(#{ explode: true }) filter?: "lined_up" | "recommended",
  ): (OkResponse & Body<Car[]>) | UnauthorizedResponse;

  @get
  op get(...Parameters.carId): (OkResponse &
    Body<Car>) | NotFoundResponse | UnauthorizedResponse;

  @post
  op create(@body body: CreateCar): (CreatedResponse &
    Body<Car>) | BadRequestResponse;

  @patch(#{ implicitOptionality: true })
  op update(...Parameters.carId, @body body: UpdateCar):
    | (OkResponse & Body<Car>)
    | NotFoundResponse
    | BadRequestResponse
    | UnauthorizedResponse;

  @delete
  op delete(
    ...Parameters.carId,
  ): NoContentResponse | NotFoundResponse | UnauthorizedResponse;

  @route("/{carId}/sold")
  @patch(#{ implicitOptionality: true })
  op sold(...Parameters.carId, @query sold: boolean): (OkResponse &
    Body<Car>) | NotFoundResponse | UnauthorizedResponse;

  @route("/{carId}/images")
  namespace Images {
    @get
    op list(...Parameters.carId): (OkResponse &
      Body<Image[]>) | UnauthorizedResponse;

    @get
    op get(...Parameters.carId, ...Parameters.imageId): (OkResponse &
      Body<Image>) | NotFoundResponse | UnauthorizedResponse;

    @post
    op create(
      ...Parameters.carId,
      @body body: CreateImagePayload,
    ): (CreatedResponse &
      Body<Image>) | BadRequestResponse | UnauthorizedResponse;

    @patch(#{ implicitOptionality: true })
    op update(
      ...Parameters.carId,
      ...Parameters.imageId,
      @body body: UpdateImagePayload,
    ):
      | (OkResponse & Body<Image>)
      | NotFoundResponse
      | BadRequestResponse
      | UnauthorizedResponse;

    @delete
    op delete(
      ...Parameters.carId,
      ...Parameters.imageId,
    ): NoContentResponse | NotFoundResponse | UnauthorizedResponse;
  }

  @route("/{carId}/prices")
  namespace Prices {
    @get
    op list(...Parameters.carId): (OkResponse &
      Body<Price[]>) | UnauthorizedResponse;

    @get
    op get(...Parameters.carId, ...Parameters.priceId): (OkResponse &
      Body<Price>) | NotFoundResponse | UnauthorizedResponse;

    @post
    op create(
      ...Parameters.carId,
      @body body: CreatePricePayload,
    ): (CreatedResponse &
      Body<Price>) | BadRequestResponse | UnauthorizedResponse;

    @patch(#{ implicitOptionality: true })
    op update(
      ...Parameters.carId,
      ...Parameters.priceId,
      @body body: UpdatePricePayload,
    ):
      | (OkResponse & Body<Price>)
      | NotFoundResponse
      | BadRequestResponse
      | UnauthorizedResponse;

    @delete
    op delete(
      ...Parameters.carId,
      ...Parameters.priceId,
    ): NoContentResponse | NotFoundResponse | UnauthorizedResponse;
  }
}

@route("/attributes")
namespace Attributes {
  @get
  op list(): (OkResponse & Body<Attribute[]>) | UnauthorizedResponse;

  @get
  op get(...Parameters.attributeId): (OkResponse &
    Body<Attribute>) | NotFoundResponse | UnauthorizedResponse;

  @post
  op create(@body body: CreateAttributePayload): (CreatedResponse &
    Body<Attribute>) | BadRequestResponse | UnauthorizedResponse;

  @patch(#{ implicitOptionality: true })
  op update(...Parameters.attributeId, @body body: UpdateAttributePayload):
    | (OkResponse & Body<Attribute>)
    | NotFoundResponse
    | BadRequestResponse
    | UnauthorizedResponse;

  @delete
  op delete(
    ...Parameters.attributeId,
  ): NoContentResponse | NotFoundResponse | UnauthorizedResponse;

  @route("/attributes/{attributeId}/choices")
  namespace Choices {
    @get
    op list(...Parameters.attributeId): (OkResponse &
      Body<Choice[]>) | UnauthorizedResponse;

    @get
    op get(...Parameters.attributeId, ...Parameters.choiceId): (OkResponse &
      Body<Choice>) | NotFoundResponse | UnauthorizedResponse;

    @post
    op create(
      ...Parameters.attributeId,
      @body body: CreateChoicePayload,
    ): (CreatedResponse &
      Body<Choice>) | BadRequestResponse | UnauthorizedResponse;

    @patch(#{ implicitOptionality: true })
    op update(
      ...Parameters.attributeId,
      ...Parameters.choiceId,
      @body body: UpdateChoicePayload,
    ):
      | (OkResponse & Body<Choice>)
      | NotFoundResponse
      | BadRequestResponse
      | UnauthorizedResponse;

    @delete
    op delete(
      ...Parameters.attributeId,
      ...Parameters.choiceId,
    ): NoContentResponse | NotFoundResponse | UnauthorizedResponse;
  }
}
