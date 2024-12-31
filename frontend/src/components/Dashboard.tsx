import { useEffect, useState } from 'react'
import MUIDataTable from 'mui-datatables'
import apiService from '@/service/api-service'
import type UserDto from '@/interfaces/UserDto'
import type { AxiosResponse } from '~/axios'

const columns: string[] = ['Id', 'Name']

export default function Dashboard() {
  const [data, setData] = useState([])

  useEffect(() => {
    setData([['1000', 'Sunshine Coast Plan'],['1001', 'Thompson Rivers Plan']])
    // apiService
    //   .getAxiosInstance()
    //   .get('/v1/users')
    //   .then((response: AxiosResponse) => {
    //     setData(
    //       response.data.map((user: UserDto) => [
    //         user.id,
    //         user.name,
    //         user.email,
    //       ]),
    //     )
    //   })
    //   .catch((error) => {
    //     console.error(error)
    //   })
  }, [])

  return <MUIDataTable title={'Forest Operation Plans'} data={data} columns={columns} />
}
