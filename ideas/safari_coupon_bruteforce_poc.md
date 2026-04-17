---
name: Safari extension PoC — coupon code brute-force (mock)
description: Build a Safari extension that brute-forces 7-digit numeric coupon codes against a local mock server simulating Sodimac's coupon endpoint
type: project
created: 2026-04-03
---

## Idea

Safari extension that prueba códigos de descuento de 7 dígitos numéricos (formato Sodimac Argentina) por fuerza bruta hasta encontrar uno válido.

**Approach:** Montar un servidor local mock que simule el endpoint de validación de cupones, y la extensión prueba contra ese mock. No contra el sitio real.

**Context:** Los cupones de Sodimac Argentina son 7 dígitos numéricos (ej: 9133534, 9070958), asignados por DNI vía sodimac.marketec.com.ar.

**Status:** Pendiente — Lautaro lo va a ejecutar en otro momento.
