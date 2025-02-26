import os

import requests
from loguru import logger

from chatbi.model.cube import CubeEntityDTO, CubeQueryDTO

cube_service_api = os.getenv("CUBE_SERVICE_API", "http://localhost:4000")


class CubeService:
    def query(self, payload: CubeQueryDTO):
        headers = {"Content-type": "application/json"}

        try:
            logger.debug(f"Cube payload: {payload}")
            # send request to cube service
            response = requests.post(
                f"{cube_service_api}/cubejs-api/v1/load",
                headers=headers,
                data=payload,
            )
            result = response.json()

            # logger.debug(f"Cube response: {result}")

            return {"data": result, "code": 200}
        except Exception as e:
            logger.error(f"Error parsing payload: {e}")
            return {"data": "error", "code": 400}

    def simplify_meta(self, cubes: list[CubeEntityDTO]):
        """Simplify meta data."""
        simplified = []
        for cube in cubes:
            cube_name = cube.get("name", "")

            # only use name, type, drillMembers, aliasName, shortTitle
            # TODO: need optimization depends on the LLM prompt optimization
            measures = [
                {
                    "name": measure.get("name", ""),
                    "type": measure.get("type", ""),
                    "drillMembers": measure.get("drillMembers", []),
                    "aliasName": measure.get("aliasName", ""),
                    "shortTitle": measure.get("shortTitle", ""),
                }
                for measure in cube.get("measures", [])
            ]

            # only use name, type, suggestFilterValues, aliasName, shortTitle
            dimensions = [
                {
                    "name": dimension.get("name", ""),
                    "type": dimension.get("type", ""),
                    "suggestFilterValues": dimension.get("suggestFilterValues", ""),
                    "aliasName": dimension.get("aliasName", ""),
                    "shortTitle": dimension.get("shortTitle", ""),
                }
                for dimension in cube.get("dimensions", [])
            ]
            segments = cube.get("segments", [])
            simplified.append(
                {
                    "name": cube_name,
                    "measures": measures,
                    "dimensions": dimensions,
                    "segments": segments,
                }
            )
        return simplified

    def get_meta(self, table_name: str | None = None):
        response = requests.get(f"{cube_service_api}/cubejs-api/v1/meta")
        cubes = response.json().get("cubes", [])

        logger.debug(f"Cube meta source: {cubes}")
        simplified_cubes = self.simplify_meta(cubes)

        logger.debug(f"Cube meta simplified: {simplified_cubes}")

        if table_name:
            # filter model data, case insensitive, do not use next function
            model_data = [
                cube
                for cube in simplified_cubes
                if cube.get("name", "").lower() == table_name.lower()
            ]
            if model_data:
                return {"data": model_data, "code": 200}
            else:
                return {"data": [], "code": 400}
        else:
            return {"data": simplified_cubes, "code": 200}


"""Example data
{
    "cubes": [
        {
        "name": "Users",
        "title": "Users",
        "meta": {
            "someKey": "someValue",
            "nested": {
                "someKey": "someValue"
            }
        },
        "connectedComponent": 1,
        "measures": [
            {
            "name": "users.count",
            "title": "Users Count",
            "shortTitle": "Count",
            "aliasName": "users.count",
            "type": "number",
            "aggType": "count",
            "drillMembers": ["users.id", "users.city", "users.createdAt"]
            }
        ],
        "dimensions": [
            {
            "name": "users.city",
            "title": "Users City",
            "type": "string",
            "aliasName": "users.city",
            "shortTitle": "City",
            "suggestFilterValues": true
            }
        ],
        "segments": []
        }
    ]
}
"""


cube_service = CubeService()
