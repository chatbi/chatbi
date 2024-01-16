import { useEffect, useRef } from 'react';
import embed, { vega } from 'vega-embed';

interface VegaProps {
  spec: any;
  data?: Record<string, any>[];
}

const ReactVega: React.FC<VegaProps> = ({ spec, data }) => {
  const container = useRef<HTMLDivElement>(null);

  const theme = 'light';

  useEffect(() => {
    if (container.current && data) {
      spec.data = {
        name: 'data',
      };
      embed(container.current, spec, {
        width: 368,
        actions: false,
        config: {
          background: 'transparent',
        },
      }).then(({ view }) => {
        view.change(
          'data',
          vega
            .changeset()
            .remove(() => true)
            .insert(data),
        );
        view.run();
        // view.resize();
      });
    }
  }, [spec, data, theme]);
  return <div ref={container} className="w-full w-[368px] bg-white p-5"></div>;
};

export default ReactVega;
