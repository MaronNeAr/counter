import { get, post, deletes, getBaseURL } from './request'

const HttpManager = {

  //添加课程
  addCourse:(params) => post(`course/add`, params),
  //选课
  selectCourse: (id) => get(`course/select/${id}`),
  //获取所有课程信息

  getAllCourse: () => get(`course`),
  // 获取图片信息
  attachImageUrl: (url) => `${getBaseURL()}/${url}`,
  // =======================> 管理员 API
  // 是否登录成功
  getLoginStatus: (params) => post(`admin/login/status`, params),

  // =======================> 用户 API
  // 返回所有用户
  getAllUser: () => get(`user`),
  // 返回指定ID的用户
  getUserOfId: (id) => get(`user/detail?id=${id}`),
  // 添加用户
  setUser: (params) => post(`user/add`, params),
  // 更新用户信息
  updateUserMsg: (params) => post(`user/update`, params),
  // 删除用户
  deleteUser: (id) => get(`user/delete?id=${id}`),

  // =======================> 收藏列表 API
  // 返回的指定用户ID收藏列表
  getCollectionOfUser: (userId) => get(`collection/detail?userId=${userId}`),
  // 删除收藏的歌曲
  deleteCollection: (userId, songId) => deletes(`collection/delete?userId=${userId}&&songId=${songId}`),

  // =======================> 评论列表 API
  // 获得指定歌曲ID的评论列表
  getCommentOfSongId: (songId) => get(`comment/song/detail?songId=${songId}`),
  // 获得指定歌单ID的评论列表
  getCommentOfSongListId: (songListId) => get(`comment/songList/detail?songListId=${songListId}`),
  // 删除评论
  deleteComment: (id) => get(`comment/delete?id=${id}`),

  // =======================> 歌手 API
  // 返回所有歌手
  getAllSinger: () => get(`singer`),
  // 添加歌手
  setSinger: (params) => post(`singer/add`, params),
  // 更新歌手信息
  updateSingerMsg: (params) => post(`singer/update`, params),
  // 删除歌手
  deleteSinger: (id) => get(`singer/delete?id=${id}`),

  // =======================> 歌曲 API
  // 返回所有歌曲
  getAllSong: () => get(`song`),
  // 返回指定歌手ID的歌曲
  getSongOfSingerId: (id) => get(`song/singer/detail?singerId=${id}`),
  // 返回的指定用户ID收藏列表
  getSongOfId: (id) => get(`song/detail?id=${id}`),
  // 返回指定歌手名的歌曲
  getSongOfSingerName: (id) => get(`song/singerName/detail?name=${id}`),
  // 更新歌曲信息
  updateSongMsg: (params) => post(`song/update`, params),
  updateSongUrl: (id) => `${getBaseURL()}/song/url/update?id=${id}`,
  updateSongImg: (id) => `${getBaseURL()}/song/img/update?id=${id}`,
  // 删除歌曲
  deleteSong: (id) => get(`song/delete?id=${id}`),

  // =======================> 歌单 API
  // 添加歌单
  setSongList: (params) => post(`songList/add`, params),
  // 获取全部歌单
  getSongList: () => get(`songList`),
  // 更新歌单信息
  updateSongListMsg: (params) => post(`songList/update`, params),
  // 删除歌单
  deleteSongList: (id) => get(`songList/delete?id=${id}`),

  // =======================> 歌单歌曲 API
  // 给歌单添加歌曲
  setListSong: (params) => post(`listSong/add`, params),
  // 返回歌单里指定歌单ID的歌曲
  getListSongOfSongId: (songListId) => get(`listSong/detail?songListId=${songListId}`),
  // 删除歌单里的歌曲
  deleteListSong: (songId) => get(`listSong/delete?songId=${songId}`),


  // ==============================================================================================>


  //IMusic的api

  // =======================> 用户 API
  // 登录
  signIn: (params) => post(`user/login/status`, params),
  // 注册
  SignUp: (params) => post(`user/add`, params),
  updateUserPassword: (params) => post(`user/updatePassword`, params),
  // 更新用户头像
  uploadUrl: (userId) => `${getBaseURL()}/user/avatar/update?id=${userId}`,

  // =======================> 歌单 API
  // 获取歌单类型
  getSongListOfStyle: (style) => get(`songList/style/detail?style=${style}`),
  // 返回标题包含文字的歌单
  getSongListOfLikeTitle: (keywords) => get(`songList/likeTitle/detail?title=${keywords}`),

  // =======================> 歌手 API
  // 返回所有歌手
  // 通过性别对歌手分类
  getSingerOfSex: (sex) => get(`singer/sex/detail?sex=${sex}`),

  // =======================> 收藏 API
  // 添加收藏的歌曲 type: 0 代表歌曲， 1 代表歌单
  setCollection: (params) => post(`collection/add`, params),

  isCollection: (params) => post(`collection/status`, params),

  // =======================> 评分 API
  // 提交评分
  setRank: (params) => post(`rankList/add`, params),
  // 获取指定歌单的评分
  getRankOfSongListId: (songListId) => get(`rankList?songListId=${songListId}`),
  // 获取指定用户的歌单评分
  getUserRank: (consumerId, songListId) => get(`/rankList/user?consumerId=${consumerId}&songListId=${songListId}`),

  // =======================> 评论 API
  // 添加评论
  setComment: (params) => post(`comment/add`, params),
  // 点赞
  setSupport: (params) => post(`comment/like`, params),
  // 返回所有评论
  getAllComment: (type, id) => {
    let url = "";
    if (type === 1) {
      url = `comment/songList/detail?songListId=${id}`;
    } else if (type === 0) {
      url = `comment/song/detail?songId=${id}`;
    }
    return get(url);
  },

  // =======================> 歌曲 API
  // 返回指定歌手ID的歌曲
  // 下载音乐
  downloadMusic: (url) => get(url, { responseType: "blob" }),

}

export { HttpManager }
