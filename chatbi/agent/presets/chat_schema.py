"""define types for chart config

Refer to typescript definition: ./chart_chema.ts
"""

from typing import Annotated, Literal, NotRequired, Required

from typing_extensions import Doc, TypedDict


class EncodeConfig(TypedDict):
    """Chart Encode Config

    Encoding is mainly used to specify the relationship between visual element attributes and data.
    Usually used for defining the axis field for the chart(line, bar, pie, scatter)
    if the type is auto, the axis field will be auto detected, so the encoding is not necessary.
    """

    x: Required[Annotated[str, Doc("""axis x field""")]]
    y: Required[Annotated[str, Doc("""axis y field""")]]
    color: NotRequired[Annotated[str, Doc("""color field, used for color encoding""")]]


class StyleConfig(TypedDict):
    """Chart Style Config

    Style in G2 is mainly used to control the visual style of mark and view.
    """

    fill: Annotated[str, Doc("""The fill color of the graphic""")]
    stroke: Annotated[str, Doc("""The stroke color of the graphic""")]


class ChartConfig(TypedDict):
    type: Annotated[
        Literal["line", "bar", "pie", "scatter", "auto"],
        "default: auto",
        Doc(
            """
            chart type:
                line: line chart
                bar: bar chart
                pie: pie chart
                scatter: scatter chart
                auto: auto detect the chart type
        """
        ),
    ]
    encode: Annotated[EncodeConfig, Doc("""chart encode config""")]
    style: Annotated[StyleConfig, Doc("""chart style config""")]
