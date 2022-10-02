import { get, post, deletes, getBaseURL } from './request'

const HttpManager = {

  //获取所有课程信息
  getAllCourse: () => get(`course`),
  //获取所有竞赛信息
  getAllContest: () => get(`contest`),


  // 获取图片信息
  attachImageUrl: (url) => `${getBaseURL()}/${url}`,
  //添加课程
  addCourse:(params) => post(`course/add`, params)
  
}

export { HttpManager }
