# Usa a imagem base com JDK 11
FROM openjdk:11

# Copia o arquivo Java para dentro do contêiner
COPY src/main/java/br/unicamp/ic/inf335/OlaUnicamp.java /usr/src/app/OlaUnicamp.java

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Compila o arquivo Java
RUN javac OlaUnicamp.java

# Executa o comando java para rodar a classe OlaUnicamp
CMD ["java", "OlaUnicamp.java"]