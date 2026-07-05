# 2. Domain Model and Taxonomy

This section defines the core entities and data structures of the platform.

## 2.1. Core Entities

### 2.1.1. Casa (Institution)
The root entity representing a Spiritist Center. Contains:
- **Mandatory Basic Data:** Name, City, Locality, Admin info: Name Phone Email, and Virtual Status (`virtual` indicating online-only vs physical).
- **Public Contact:** Dedicated channels for the public (website, general phone).
- **Public Address:** Address, Locality, City, State, IBGE Code, Country (Default Brasil)

- **Activity Classifications (Basic Profile):** General checkboxes indicating the types of activities the Casa performs. *Note: Selecting these only flags that the Casa does the activity; it does not replace the deep Activity CRUD records.*
- **Reuniões Públicas (Special Case):** Due to their extreme importance for public outreach, schedule details (days, times, details) for Public Meetings are often captured directly on the Casa's basic profile.
- **Assets:** Links to public/private documents, logos, and instructional materials.
- **Status:** Pending Review, Active, Inactive (crucial for security and trust).

### 2.1.2. Atividade (Task/Activity)
An ongoing, recurring task executed by the Casa. Represents the "Intranet" and public face of the house's work.
- **Attributes:** Slug, Name, Type, Department, Functional Area relation.
- **Logistics:** Presential / Remote / Hybrid, Physical Location.
- **Schedule:** Days, hours, exportable formats (ICS).
- **Visibility:** Public vs. Internal/Private.
- **Engagement:** Target Audience, "I want to help" flag (volunteer acceptance status), Public contacts.
- **Support Material:** Links to doctrinal, legal, operational, and financial guides.
- **Related areas:** Links to Federation areas: aart, acse, aae, aee, aeej, aij, aom, apse, aesp.

### 2.1.3. Evento (Event)
An extension of `Atividade`, but augmented with special fields like defined **Start Date** and **End Date**.
- **Special Attributes:** Registration URL, prominent promotion on Casa/Main page, social sharing features, special map pin.

### 2.1.4. Palestra (Lecture)
A specialized type of `Atividade` focused on doctrinal dissemination.
- **Special Attributes:** Speaker name, Theme, prominent display in marquee headers across the site (State/Regional level), auto-generated art (via AI integration).

### 2.1.5. Visões (Views/Contexts)
Dynamic data filters based on geographic and organizational hierarchy:
- State View, Macro View, Micro View, Municipal View, Casa View, Activity View, Neighborhood View.

## 2.2. Areas Taxonomy (Federation Functional Areas )
The federative Spiritist movement structures its work through specific work areas (resumed below), whereas individual centers carry out diverse activities - which are, in a sense, autonomous - that may align with one or more of the federative movement's work areas.

Activities are strongly typed and categorized by their doctrinal/functional area. *Note: Data mapped from `res-atividades-areas.md`.*

| Area Code | Area Name | Example Activities |
| :--- | :--- | :--- |
| **APSE** | Assistência e Promoção Social | Cesta básica, Sopa fraterna, Campanha do agasalho, Bazar, Banho população de rua |
| **AOM** | Orientação Mediúnica | Desenvolvimento Mediúnico, Reuniões Mediúnicas |
| **AEEJ**| Estudo do Evangelho de Jesus | Evangelização Infantil, Mocidade |
| **AIJ**| Infância e Juventude | Evangelização Infantil, Mocidade |
| **ACSE** | Comunicação Social Espírita | Divulgação, Livraria, Biblioteca, Reuniões Públicas |
| **AEE** | Estudo do Espiritismo | ESDE, EADE, Estudo de Obras, Princípios Básicos |
| **AAE**| Atendimento Espiritual | Atendimento Fraterno, Passe/Irradiação, Atendimento Psicológico, Visita Fraterna |
| **AFAM**| Família | Atendimento Fraterno, Passe/Irradiação, Atendimento Psicológico, Visita Fraterna |
| **AESP**| Esperanto | Esperanto |
| **AART**| Arte | Esperanto |

Examples of activities:


*Compliance Note (Auditor): The taxonomy must map accurately to the National Spiritist Council (FEB) standard guidelines to maintain doctrinal alignment. Custom activities must be clearly flagged.*

## 2.3 PTMEB
Plano de trabalho do movimento espírita brasileiro.
Oferece diretrizes de trabalho para o movimento espírita Nacional

