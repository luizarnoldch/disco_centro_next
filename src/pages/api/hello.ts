// Next.js API route support: https://nextjs.org/docs/api-routes/introduction
import type { NextApiRequest, NextApiResponse } from 'next'
import { conn } from '../../utils/database'

type Data = {
  name: string
}

export default async (
  req: NextApiRequest,
  res: NextApiResponse<Data>
) => {

  const { rows } = await conn.query("SELECT * FROM disco_centro.pais;");
  res.status(200).json(rows[0])
}
