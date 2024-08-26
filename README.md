# Admin-ROR

This repository is an administrative application for managing support tickets. It interacts with the `Ticket-ror` repository via API to update tickets with responses as an admin.

## Prerequisites

- Ruby on Rails
- PostgreSQL
- API access to the `Ticket-ror` repository
- Postman for testing API endpoints

## Dependencies

This repository depends on another repository:

- **Ticket-ror**: The main application where users create support tickets.

## Setup

### 1. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/your-username/Admin-ror.git
cd Admin-ror


use this to add an admin user: (postman)
{
  "user": {
    "id": 3,
    "username": "Admin",
    "email": "admin@example.com",
    "password": "password"
  }
}


