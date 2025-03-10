
FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /src


COPY *.csproj ./
RUN dotnet restore


COPY . ./
RUN dotnet publish -c Release -o /app/publish


FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
ENTRYPOINT ["dotnet", "MyTestWebApi.dll"]