Modular Api Builder

Пакет для создания web-сервера с декларативным подходом

Сервер на старте проходит по пакетам на их основе строит рееестр это делается один раз, далее при 
поступлении запроса мы разбираем путь и ищем метод для выполнения по имени пакета и 
имени метода и версии. Если метод имя и версия не найдены но при этом есть имя и пакет то 
выдаем ошибку что мы запрашиваем неверную версию. В противном случае проходим по параметрам и 
подготавлием контекст для handle метода.

При работе с пакетом мы можем работать и наследоваться от Method для создания новых методов, 
DataType для создания конвертера и валидатора (параметры метода), ResponseContentType для 
конвертации произвольного объекта в байты

Примеры можно посмотреть в папке example

## Plugin API ##

- **Plugin** - возможность задавать хуки
- **PluginProvider** - хуки плюс *PluginOptions*
- **PluginConsumer** - хуки и возможность получить *PluginOptions*

*PluginOptions* доступна в *MethodCtx* и *DataTypeCtx* классах по дженерику

### Hooks ###

**ErrorHandleHook** - Выброс события с информацией об ошибке *ErrorHandleEvent*