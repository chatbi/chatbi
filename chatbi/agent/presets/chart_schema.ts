export interface ChartConfig {
  /**
   * chart type
   * line: line chart
   * bar: bar chart
   * pie: pie chart
   * scatter: scatter chart
   * auto: auto detect the chart type
   */
  type: 'line' | 'bar' | 'pie' | 'scatter' | 'auto'
  /**
   * Encoding is mainly used to specify the relationship between visual element attributes and data.
   * Usually used for defining the axis field for the chart(line, bar, pie, scatter)
   * if the type is auto, the axis field will be auto detected, so the encoding is not necessary.
   */
  encode?: {
    /**
     * axis x field
     */
    x?: string
    /**
     * axis y field
     */
    y?: string

    /**
     * color field, used for color encoding
     */
    color?: string
  }

  /**
   * Style in G2 is mainly used to control the visual style of mark and view.
   */
  style?: {
    /**
     * The fill color of the graphic
     */
    fill?: string

    /**
     * The stroke color of the graphic
     */
    stroke?: string
  }
}
