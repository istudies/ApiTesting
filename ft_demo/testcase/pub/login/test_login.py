# -*- coding:utf-8 -*-
# @Time    : 2021/2/2
# @Author  : Leo Zhang
# @File    : test_login.py
# ****************************
import os
import allure
import pytest
from comm.utils import get_case
from comm.unit.initializePremise import init_premise
from comm.unit.apiSend import send_request
from comm.unit.checkResult import check_result
case_path, case_data = get_case(os.path.realpath(__file__))


@allure.feature(case_data["test_info"]["title"])
class TestLogin:

    @pytest.mark.parametrize("test_case", case_data["test_case"])
    @allure.story("test_login")
    def test_login(self, test_case):
        # 初始化请求：执行前置接口+替换关联变量
        test_info, test_case = init_premise(case_data["test_info"], test_case, case_path)
        # 发送当前接口
        code, data = send_request(test_info, test_case)
        # 校验接口返回
        check_result(test_case, code, data)
