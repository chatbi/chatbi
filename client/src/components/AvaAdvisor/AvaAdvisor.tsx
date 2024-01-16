import { Advisor } from '@antv/ava';
import React, { createRef, useEffect, useState } from 'react';

import G2Chart from '../G2Chart/G2Chart';
import AvaInsight from './AvaInsight';
import { demoData } from './demo';

interface AvaAdvisorProps {
  data: Record<string, any>[];
}

const AvaAdvisor: React.FC<AvaAdvisorProps> = ({ data }) => {
  const chartRef = createRef<HTMLDivElement>();
  const [adviseResults, setAdviseResults] = useState<any[]>([]);

  useEffect(() => {
    async function getAdvise() {
      const chatAdvisor = new Advisor();
      const results = chatAdvisor.advise({
        data: demoData,
        // fields: ['product_code', 'buy_price'],
        options: {
          showLog: true,
        },
      });

      console.log(results);

      setAdviseResults(results);
    }
    getAdvise();
  }, [data]);

  return (
    <div className="w-full h-full overflow-hidden box-border p-4">
      {adviseResults[0] ? (
        <G2Chart
          className="bg-white"
          chartRef={chartRef}
          spec={adviseResults[0]?.spec}
        />
      ) : (
        <AvaInsight data={data} />
      )}
    </div>
  );
};

export default AvaAdvisor;
