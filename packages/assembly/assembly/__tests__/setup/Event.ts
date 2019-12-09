

export class Event {
    data: string;
}

export type Listener = (event: Event) => void;

export class EventDispatcher {
    events: Array<Listener> = new Array();
}

export const listener: Listener = (event: Event) => {};
export const anotherListener: Listener = (event: Event) => {
  let x: i32 = 0;
  x + x;
};