# 4. Identity and Access Management (RBAC)

This document outlines the Role-Based Access Control matrix. It is critical for maintaining data integrity and compliance with privacy by default.

## 4.1. Roles Definition
- **Visitante (Visitor):** Unauthenticated public user.
- **Tarefeiro (Volunteer):** Authenticated user linked to a Casa, participating in activities.
- **Coordenador (Coordinator):** Volunteer managing specific activities/departments within a Casa.
- **Admin de Casa (House Admin):** Highest authority within a specific Casa.
- **Revisor (Reviewer):** Regional agent responsible for validating new Casas joining the platform.
- **CRE / Órgão Municipal (Regional Rep):** Representative for Micro/Municipal regions.
- **Federativa Área (State Rep):** Representative of the State Federative.

## 4.2. Permissions Matrix

| Profile | Atividades | Eventos | Palestras | Assets | Users (Casa) | Features Fed. | Visões Permitidas |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Visitante** | Ver (Public) | Ver | Ver | Ver (Public) | - | - | Públicas |
| **Tarefeiro** | Ver | Ver | Ver | Ver | - | - | Casa / Públicas |
| **Coordenador** | Gerenciar* | Gerenciar* | Gerenciar* | Gerenciar*| - | - | Casa / Públicas |
| **Admin de Casa**| Gerenciar | Gerenciar | Gerenciar | Gerenciar | Gerenciar | - | Casa / Públicas |
| **Revisor** | Ver | Ver | Ver | Ver | - | - | Regional / Casa |
| **CRE / Municipal**| Ver | Ver | Ver | Ver | - | - | Regional / Casa |
| **Federativa** | Ver | Ver | Ver | Ver | - | Gerenciar | Estadual / Todas |

*\* Coordenadores can only manage resources assigned to their specific department/scope.*

## 4.3. Compliance Rules (Auditor's Note)
1. **Segregation of Duties:** Federative users cannot alter Casa data directly. They can only view and manage Federative-level features. Only House Admins and Coordinators can modify House data.
2. **Principle of Least Privilege:** Volunteers (Tarefeiros) default to View-only access within the internal Intranet unless explicitly assigned a Coordinator role.
3. **Audit Trails:** All `Gerenciar` (Create/Update/Delete) actions by Admins and Coordinators MUST generate an immutable audit log, capturing the User ID, Timestamp, Resource ID, and Action.
