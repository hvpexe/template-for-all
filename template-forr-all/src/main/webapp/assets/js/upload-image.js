function getObjURL(file) {
    url = URL.revokeObjectURL(file)//undefined;
    return url || URL.createObjectURL(file)//;
}
