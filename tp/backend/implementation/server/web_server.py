from flask import Flask, request, Response
import sys
from backend.implementation.outer_layer.tus_libros_http_interface import (
    TusLibrosHTTPInterface,
)
from flask_cors import CORS
from backend.external_services.oauth_authentication_system import (
    OAuthAuthenticationSystem,
)
from backend.external_services.mercado_pago import MercadoPago
from datetime import datetime, timedelta


class WebServer:
    """initialize"""

    def __init__(self):
        self.server = Flask(__name__)
        CORS(self.server, supports_credentials=True)  # Enable CORS and allow cookies

        self.setup_routes()
        catalog = {
            "9780137314942": 31.505,
            "9780321278654": 45.305,
            "9780201710915": 45.180,
            "9780321125217": 41.000,
            "9780735619654": 34.900,
            "9780321146533": 29.100,
        }

        authenticator = OAuthAuthenticationSystem()
        payment_processor = MercadoPago()

        expiration_time = timedelta(minutes=30)

        self.tus_libros_http_interface = TusLibrosHTTPInterface.with_catalog_authenticator_payment_processor_expiration_time_clock(
            catalog,
            authenticator,
            payment_processor,
            expiration_time,
            datetime,
        )

    """main protocol"""

    def setup_routes(self):
        @self.server.route("/createCart", methods=["GET"])
        def create_cart():
            args = request.args.to_dict()
            status_code, body_response = self.tus_libros_http_interface.create_cart(
                args
            )

            return Response(response=body_response, status=status_code)

        @self.server.route("/listCart", methods=["GET"])
        def list_cart():
            args = request.args.to_dict()
            status_code, body_response = self.tus_libros_http_interface.list_cart(args)

            return Response(response=body_response, status=status_code)

        @self.server.route("/addToCart", methods=["GET"])
        def add_to_cart():
            args = request.args.to_dict()
            status_code, body_response = self.tus_libros_http_interface.add_to_cart(
                args
            )

            return Response(response=body_response, status=status_code)

        @self.server.route("/checkOutCart", methods=["GET"])
        def check_out_cart():
            args = request.args.to_dict()
            status_code, body_response = self.tus_libros_http_interface.checkout_cart(
                args
            )

            return Response(response=body_response, status=status_code)

        @self.server.route("/listPurchases", methods=["GET"])
        def list_purchases():
            args = request.args.to_dict()
            status_code, body_response = self.tus_libros_http_interface.list_purchases(
                args
            )

            return Response(response=body_response, status=status_code)

    def listening_on(self, port):
        self.server.run(port=port, debug=True)


if __name__ == "__main__":
    if len(sys.argv) > 1:
        port = sys.argv[1]
    else:
        port = 9000

    web_server = WebServer()
    web_server.listening_on(9000)
