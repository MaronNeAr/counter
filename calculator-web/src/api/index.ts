import { get, post, deletes, getBaseURL } from './request'

const HttpManager = {

  //获取所有课程信息
  getAllCourse: () => get(`course`),
  //获取所有竞赛信息
  getAllContest: () => get(`contest`),
  //获取商品分类
  getClassify: () => get(`classify`),
  //获取对应商品列表
  getGoods: (cid) => get(`goods/${cid}`),
  //获取所有商品
  getAllGoods: () => get(`goods`),


  // 获取图片信息
  attachImageUrl: (url) => `${getBaseURL()}/${url}`,
  //添加课程
  addCourse:(params) => post(`course/add`, params)
  
}

export { HttpManager }
