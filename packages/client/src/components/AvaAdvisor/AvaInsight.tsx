import React, { useEffect, useState } from 'react';

import { getInsights, type InsightsResult } from '@antv/ava';
import { InsightCard } from '@antv/ava-react';
import { Carousel } from 'antd';

interface AvaInsightProps {
  data: Record<string, any>[];
}

const AvaInsight: React.FC<AvaInsightProps> = ({ data }) => {
  const [result, setResult] = useState<InsightsResult>({
    insights: [],
  });

  useEffect(() => {
    async function getInsight() {
      const insightResult = getInsights(data, {
        limit: 10,
        // dimensions: [{ fieldName: 'date' }],
        // measures: [{ fieldName: 'discount_price', method: 'SUM' }],
        visualization: true,
      });
      setResult(insightResult);
    }
    getInsight();
  }, [data]);

  return result.insights?.length > 0 ? (
    <div className="w-full h-full overflow-hidden">
      <Carousel arrows={false}>
        {result.insights &&
          result.insights.map((insight, index) => {
            return <InsightCard insightInfo={insight} key={index} />;
          })}
      </Carousel>
    </div>
  ) : (
    <span>No visualization found.</span>
  );
};

export default AvaInsight;
