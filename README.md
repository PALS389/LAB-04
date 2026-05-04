# AWS + Lambda Integration: Arquitectura Multientorno Escalable - LAB-04

Este proyecto implementa una arquitectura serverless robusta y de alta disponibilidad en Amazon Web Services (AWS), diseñada mediante Terraform para soportar despliegues automatizados en entornos de Desarrollo, Calidad y Producción.

**Autor:** Piero Alejandro Leyva Sandoval (PALS)  
**Institución:** Universidad Privada Antenor Orrego (UPAO)  
**Curso:** Arquitectura de Sistemas / Laboratorio de Cloud Computing  

---

## 🎯 Objetivo del Proyecto
Desplegar una solución basada en microservicios (AWS Lambda) para el procesamiento de imágenes, integrando servicios de mensajería (SQS), almacenamiento (S3) y redes privadas (VPC) para garantizar que el tráfico de datos nunca toque la internet pública, cumpliendo con el diseño definido en el diagrama Mermaid adjunto.

## 🏗️ Arquitectura del Sistema
La solución se basa en los siguientes componentes:

- **Redes (VPC):** Configuración de subredes públicas y privadas en dos zonas de disponibilidad (us-east-1a y 1b). Uso de NAT Gateways para salida segura y VPC Endpoints (Interface y Gateway) para comunicación privada con S3 y SQS.
- **Cómputo:** Funciones AWS Lambda (Node.js 20.x) con lógica para carga de archivos y procesamiento de imágenes utilizando la librería `sharp`.
- **Almacenamiento y Mensajería:** Buckets de S3 con políticas de ciclo de vida (30/90 días) y colas SQS con Dead-Letter Queue (DLQ) para manejo de errores.
- **Seguridad:** Roles de IAM basados en el principio de menor privilegio y Security Groups para control de tráfico.
- **API:** **API Gateway HTTP v2** como punto de entrada seguro.

## 🛠️ Tecnologías Utilizadas
- **IaC:** Terraform v1.x (Workspaces para DEV, QA, PROD).
- **Lenguaje:** Node.js 20.x (librerías: `@aws-sdk/client-s3`, `sharp`, `busboy`).
- **SO de Desarrollo:** Windows con WSL (Ubuntu).
- **Editor:** Visual Studio Code.

---

## 📁 Estructura del Proyecto
```text
LAB-04/
├── terraform/          # Archivos de configuración de infraestructura
│   ├── main.tf
│   ├── network.tf      # VPC, Subnets, NAT, Routes
│   ├── storage_messaging.tf
│   ├── compute_observability.tf
│   ├── variables.tf
│   └── *.tfvars        # Parámetros por entorno
├── src/                # Código fuente de las Lambdas
│   ├── upload-lambda/  # Recepción de imágenes
│   └── crop-lambda/    # Procesamiento (Recorte circular 40x40)
└── README.md