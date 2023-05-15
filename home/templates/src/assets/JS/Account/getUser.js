export const getUser = async () => {
    try {
      const response = await fetch('http://192.168.38.108:8000/api/users/');
      const data = await response.json();
      return data;
    } catch (error) {
      throw new Error(error);
    }
};

const users = await getUser()

export const getUserById = (id) => {
    return users.find(user => user.id === id)
}

