# New Features in Spring Boot 3

## 1. Java 17 Baseline
- Spring Boot 3.x requires Java 17 or higher.

## 2. Jakarta EE 9 Transition
- Package names have changed from `javax` to `jakarta`.
- For example, `javax.persistence.*` is now `jakarta.persistence.*`.

## 3. GraalVM Native Image Support
- Spring Boot 3 provides improved support for creating native images using GraalVM.
- This helps in reducing application startup time and memory usage.

## 4. Enhanced Observability
- Enhanced metrics, tracing, and logging support.
- Integrate with observability tools like Prometheus, Grafana, etc.

## 5. New Annotations
- `@RestControllerAdvice`: Centralize exception handling across all controllers.
- Simplifies exception management in REST APIs.
