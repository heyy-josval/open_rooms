# Open Rooms

```markdown
#     #     #  #       #      #      #      #
#     #     #  #       #      #      # #
#######     #  #       #      #      #
#     #     #  #       #      #      # #
#     #     #  #######  ###### #      #      #
```

**Aplicación Flutter para gestión de espacios y reservas**

---

## Descripción

Open Rooms es una aplicación móvil multiplataforma desarrollada con Flutter que permite gestionar el uso de espacios o "rooms". Incluye funcionalidades de calendario, reservas, autenticación de usuarios y gestión de laboratorios.

---

## Características

### Autenticación
- Login y logout de usuarios
- Estado de autenticación persistente
- Integración con Firebase Authentication

### Navegación
- Sistema de rutas con `go_router`
- Navegación fluida entre pantallas
- Manejo de estados de autenticación

### Módulos Principales

| Módulo | Descripción |
|--------|-------------|
| **Home** | Pantalla principal de la aplicación |
| **Login** | Inicio de sesión de usuarios |
| **Calendar** | Visualización y gestión de eventos en calendario |
| **Labs** | Gestión de laboratorios |
| **Door** | Control de acceso a espacios |
| **Profile** | Perfil de usuario |
| **Error** | Pantalla de manejo de errores |

---

## Instalación

### Prerrequisitos

- Flutter SDK (>= 3.4.1)
- Dart SDK (>= 3.4.1)
- Android Studio / Xcode para desarrollo móvil
- Firebase project configurado (opcional para desarrollo)

### Pasos de instalación

```bash
# Clonar el repositorio
git clone <url-del-repositorio>
cd open_rooms

# Instalar dependencias
flutter pub get

# Ejecutar la aplicación
flutter run
```

---

## Configuración

### Firebase

La aplicación utiliza Firebase para autenticación y base de datos. Para configurar:

1. Crea un proyecto en [Firebase Console](https://console.firebase.google.com/)
2. Agrega apps para Android, iOS, Web según necesites
3. Descarga el archivo `google-services.json` para Android
4. Ejecuta FlutterFire CLI para generar `firebase_options.dart`:

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

---

## Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada
├── firebase_options.dart     # Configuración de Firebase
├── project/
│   ├── classes/             # Modelos de datos
│   │   ├── calendar_data.dart
│   │   ├── date_day.dart
│   │   ├── event.dart
│   │   └── events.dart
│   ├── methods/             # Métodos de lógica
│   │   ├── method_login.dart
│   │   └── method_logout.dart
│   ├── pages/               # Pantallas de la app
│   │   ├── calendar.dart
│   │   ├── door.dart
│   │   ├── error.dart
│   │   ├── home.dart
│   │   ├── labs.dart
│   │   ├── login.dart
│   │   └── profile.dart
│   ├── routes/              # Configuración de rutas
│   │   ├── app_route_config.dart
│   │   └── app_route_constants.dart
│   ├── utils.dart           # Utilidades
│   └── widgets/             # Widgets reutilizables
│       ├── custom_button.dart
│       ├── custom_text_field.dart
│       └── panel_item.dart
```

---

## Tecnologías

| Tecnología | Uso |
|------------|-----|
| Flutter | Framework de desarrollo multiplataforma |
| Firebase | Autenticación y base de datos en tiempo real |
| go_router | Gestión de rutas declarativa |

---

## Desarrollo

```bash
# Ejecutar en modo debug
flutter run

# Ejecutar en Chrome
flutter run -d chrome

# Ejecutar en dispositivo Android conectado
flutter run -d android

# Ejecutar tests
flutter test
```

---

## Build para Producción

### Android
```bash
# APK
flutter build apk

# App Bundle (recomendado para Play Store)
flutter build appbundle
```

### iOS
```bash
flutter build ios
```

---

## Licencia

Este proyecto se encuentra bajo la licencia especificada en el archivo [LICENSE](LICENSE).

---

## Contacto

Para más información o contribuciones, por favor abra un issue o pull request en el repositorio.