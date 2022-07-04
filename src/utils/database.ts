import { Pool } from 'pg'

let conn: any

const connectionString: string = "postgresql://postgres:u1OboD93110614@localhost:5432/postgres"

if (!conn) {
  conn = new Pool({
    connectionString,
  });
}

export { conn };