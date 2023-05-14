export const getUser = async () => {
    try {
      const response = await fetch('http://localhost:3000/users');
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

