FROM microsoft/dotnet:2.0-sdk AS build-env

WORKDIR /app

COPY *.csproj ./

RUN dotnet restore

COPY . ./

RUN dotnet publish -c Release -o out

FROM microsoft/dotnet:2.0-runtime

COPY --from=build-env /app/out .

EXPOSE 80

ENTRYPOINT ["dotnet","test.dll"]