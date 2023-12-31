#install.packages("extrafont")
#install.packages("scales")
library(scales)
library(extrafont)
font_import()
y
library(ggplot2)

load("Desktop/spyegg/Dataframe/sanji_dataframe.rda")
load("Desktop/spyegg/Dataframe/domae_dataframe.rda")


# 그래프 그리기

ggplot(sanji, aes(x = 날짜)) +
  geom_line(aes(y = 왕란, color = "왕란"), size= 1.5) +
  geom_line(aes(y = 특란, color = "특란"), size= 1.5) +
  geom_line(aes(y = 대란, color = "대란"), size= 1.5) +
  geom_line(aes(y = 중란, color = "중란"), size= 1.5) +
  labs(x = "날짜", y = "계란가격(30개당)", color="구분", 
       title = "계란 크기별 산지 가격") +
  scale_color_manual(
    values = c("왕란" = "#FFB6C1", "특란" = "#B2EC5D", "대란" = "#CDB4DB", "중란" = "#AED6F1"),
    breaks = c("왕란", "특란", "대란", "중란"),
    labels = c("왕란", "특란", "대란", "중란")
  ) +
  scale_x_date(
    labels = date_format("%m-%d"),
    date_breaks = "5 day"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5,size=17,face='bold',family = "NanumGothic"),
    axis.text = element_text(family = "NanumGothic"),
    axis.title = element_text(family = "NanumGothic"),
    legend.title = element_text(family = "NanumGothic"),
    legend.text = element_text(family = "NanumGothic")
) -> p

ggplot(domae, aes(x = 구분)) +
  geom_line(aes(y = 왕란, color = "왕란"), size= 1.5) +
  geom_line(aes(y = 특란, color = "특란"), size= 1.5) +
  geom_line(aes(y = 대란, color = "대란"), size= 1.5) +
  geom_line(aes(y = 중란, color = "중란"), size= 1.5) +
  labs(x = "날짜", y = "계란가격(30개당)", color="구분", 
       title = "계란 크기별 도매 가격") +
  scale_color_manual(
    values = c("왕란" = "#FFB6C1", "특란" = "#B2EC5D", "대란" = "#CDB4DB", "중란" = "#AED6F1"),
    breaks = c("왕란", "특란", "대란", "중란"),
    labels = c("왕란", "특란", "대란", "중란")
  ) +
  scale_x_date(
    labels = date_format("%m-%d"),
    date_breaks = "5 day"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5,size=17,face='bold',family = "NanumGothic"),
    axis.text = element_text(family = "NanumGothic"),
    axis.title = element_text(family = "NanumGothic"),
    legend.title = element_text(family = "NanumGothic"),
    legend.text = element_text(family = "NanumGothic")
  ) -> q

ggsave(file="Desktop/spyegg/Visualization/sanji.png", plot=p, width=10, heigh=5)
ggsave(file="Desktop/spyegg/Visualization/domae.png", plot=q, width=10, heigh=5)
