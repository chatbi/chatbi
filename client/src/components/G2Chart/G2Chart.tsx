import { Chart } from '@antv/g2';
import type { G2ViewTree } from '@antv/g2/lib/runtime';
import classNames from 'classnames';
import React, { useEffect } from 'react';

export interface ChartViewProps {
  prefixCls?: string;
  className?: string;
  style?: React.CSSProperties;
  chartRef: React.RefObject<any>;
  spec: G2ViewTree;
}

const G2Chart: React.FC<ChartViewProps> = ({
  prefixCls = 'g2chart',
  className,
  style,
  chartRef,
  spec,
  ...restProps
}) => {
  const compClassName = classNames(`${prefixCls}`, className);

  const height = style?.height || 200;
  const width = style?.width || '100%';

  useEffect(() => {
    if (chartRef?.current && spec) {
      console.log(spec);

      const chart = new Chart({
        theme: 'classic',
        container: chartRef.current,
        autoFit: true,
        height: 200,
      });
      chart.options(spec);
      chart.render();
    }
  }, [spec]);

  return (
    <div
      {...restProps}
      className={compClassName}
      ref={chartRef}
      style={{ width, height, margin: 'auto' }}
    />
  );
};

export default G2Chart;
