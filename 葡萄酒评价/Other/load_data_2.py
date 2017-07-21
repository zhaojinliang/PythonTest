# coding=utf-8
"""
Author = Eric_Chan
Create_Time = 2016/08/03
"""

import xlrd
import xlwt


def load_data(file_name, sheet_index=None):
    """
    读取xls文件,获得矩阵.
    :param file_name: xls文件路径
    :param sheet_index: xls 打开的sheet序号
    :return: 所有数据二元列表
    """
    if sheet_index is None:
        sheet_index = 0
    data = xlrd.open_workbook(file_name)  # 打开xls
    table = data.sheet_by_index(sheet_index)  # 打开sheet1
    all_data = table._cell_values  # 将所有数据 以二元列表进行构造
    for i in range(all_data.__len__()):  # 将表中数据的整数转化为int类型
        for j in range(all_data[0].__len__()):

            try:
                if all_data[i][j] == int(all_data[i][j]):
                    all_data[i][j] = int(all_data[i][j])
            except ValueError:
                continue
    return all_data

def write_data(file_name, sheet_name, data):
    """

    """
    file_0 = xlwt.Workbook(encoding='utf-8')
    table_0 = file_0.add_sheet(sheet_name)
    for i in range(len(data)):
        for j in range(len(data[0])):
            table_0.write(i, j, data[i][j])
    file_0.save(file_name)


if __name__ == '__main__':
    all_data = load_data('dataSet/data_3.xls', 3)
    s = u'葡萄样品'
    data_selected = []
    for i in range(35)[1:]:
        ss = s + str(i)
        for j in range(len(all_data[0])):
            if all_data[0][j] == ss:
                temp = [t[j] for t in all_data[1:]]
                data_selected.append(temp)
    write_data('dataSet/data_3_3.xls', '红葡萄', data_selected)
