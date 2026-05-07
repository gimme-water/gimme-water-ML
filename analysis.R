library(ggplot2)
library(tidyverse)

df <- read.csv("./data.csv")
df$time <- as.POSIXct(df$time, format="%Y-%m-%d %H:%M:%OS")

df_long <- df %>%
  pivot_longer(
    cols = -c(time, device_id), 
    names_to = "metric", 
    values_to = "value"
  )

# 3. Facet을 이용한 그리드 시각화
ggplot(df_long, aes(x = time, y = value, color = metric)) +
  geom_line() +
  facet_wrap(~ metric, scales = "free_y", ncol = 3) + # 각 그래프의 Y축 범위를 데이터에 맞게 개별 설정
  theme_minimal() +
  theme(legend.position = "none") + # 범례 제거 (타이틀로 확인 가능)
  labs(title = "Environmental Sensors Monitoring",
       x = "Time",
       y = "Value")
