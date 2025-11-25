import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, TouchableOpacity, TextInput, ScrollView, Alert } from 'react-native';
import { theme } from './colors';
import { useEffect, useState } from 'react';
import AsyncStorage from '@react-native-async-storage/async-storage';

type ToDo = {
  text: string;
  working: boolean;
};

const STORAGE_KEY = "@toDos";

export default function App() {
  const [working, setWorking] = useState(true);
  const [text, setText] = useState("");
  const [toDos, setToDos] = useState<Record<string, ToDo>>({})
  const travel = () => setWorking(false);
  const work = () => setWorking(true);
  const onChangeText = (payload:string) => setText(payload)
  const saveToDos = async(toSave: Record<string, ToDo>) => {
    const s = JSON.stringify(toSave)
    await AsyncStorage.setItem(STORAGE_KEY, s)
  }
  const loadToDos = async() => {
    const s = await AsyncStorage.getItem(STORAGE_KEY)
    if(s !== null) {
      setToDos(JSON.parse(s));
    }
  }

  const deleteToDo = (key:string) => {
    Alert.alert("Delete To Do?", "Are you sure?", [
      {text:"Cancel"},
      {text:"I'm sure", onPress:() => {
        const newToDos = {...toDos};
        delete newToDos[key]
        setToDos(newToDos);
        saveToDos(newToDos);
      } }
    ])

  }

  useEffect(() => {loadToDos()}, [])
  const addToDo = async() => {
    if(text === "") {
      return;
    } 
    const newToDos = {...toDos, [Date.now()]: {text, working}}
    setToDos(newToDos)
    saveToDos(newToDos)
    setText("");
  }
  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <TouchableOpacity onPress={work}>
          <Text style={{...styles.btnText, color:working?"white":theme.grey}}>Work</Text>
          </TouchableOpacity>
        <TouchableOpacity onPress={travel}>
          <Text style={{...styles.btnText, color:!working?"white":theme.grey}}>Travel</Text>
          </TouchableOpacity>
      </View>
      <View>
        <TextInput 
        placeholder={working ? "Add a To Do":"Where do you want to go?"} 
        style={styles.input}
        value={text}
        onChangeText={onChangeText}
        onSubmitEditing={addToDo} />
        <ScrollView>{
          Object.keys(toDos).map(key => toDos[key].working === working ? (
          <View style={styles.toDo} key={key}>
            <Text style={styles.toDoText}>{toDos[key].text}</Text>
            <TouchableOpacity onPress={() => deleteToDo(key)}><Text>❌</Text></TouchableOpacity>
          </View>
          ) : null)
          }</ScrollView>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex:1,
    backgroundColor:theme.bg,
    paddingHorizontal: 20,
  },
  header: {
    justifyContent: "space-between",
    flexDirection: "row",
    marginTop: 100,
  },
  btnText: {
    fontSize: 38 ,
    fontWeight: "600",
  },
  input: {
    backgroundColor: "white",
    paddingVertical:15,
    paddingHorizontal: 20,
    borderRadius: 20,
    marginVertical:20,
    fontSize: 18,
  },
  toDo: {
    backgroundColor: theme.toDoBG,
    marginBottom : 10,
    paddingVertical: 20,
    paddingHorizontal: 40,
    borderRadius: 15,
    flexDirection: "row",
    alignItems: "center",
    justifyContent: "space-between"
  },
  toDoText:{
    color: "white",
    fontSize: 16,
    fontWeight: "600",
  },
});
