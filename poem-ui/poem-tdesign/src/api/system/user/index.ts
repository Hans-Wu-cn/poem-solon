import { request } from "@/utils/request";
import { PageResponse } from "@/api/types";
import { PageUser, PoemUser, RestPassword } from "./types";



const Api = {
  role: '/poemUser',
  rolePage: '/poemUser/page',
  restPassword: '/poemUser/restPassword',
};

/**
 * 获取用户分页列表
 * @returns Route
 */
export function userPage(params: PageUser) {
  return request.get<PageResponse<Array<PoemUser>>>({
    url: Api.rolePage,
    params
  });
}
/**
 * 新增用户
 * @returns Route
 */
export function addUser(data: PoemUser) {
  return request.post({
    url: '/poemUser',
    data
  });
}
/**
 * 编辑用户
 * @returns Route
 */
export function editUser(data: PoemUser) {
  return request.put({
    url: '/poemUser',
    data
  });
}
/**
 * 查询用户信息
 * @returns Route
 */
export function queryUserInfo(userId: string) {
  return request.get({
    url: `/poemUser/${userId}`,
  });
}

/**
 * 删除用户信息
 * @returns Route
 */
export function delUserInfo(userId: string) {
  return request.delete({
    url: `/poemUser/${userId}`,
  });
}


/**
 * 重置密码
 * @returns
 */
export function restPassword(data: RestPassword) {
  return request.put({
    url: Api.restPassword,
    data
  });
}