# React Interview Quick Reference Cheat Sheet

## 🔥 Top 10 Hooks You Must Know Cold

### 1. useState
```javascript
const [state, setState] = useState(initialValue);
```
**Interview Answer:** "Creates component state. Returns array with current value and setter function. Triggers re-render when state updates."

### 2. useEffect
```javascript
useEffect(() => {
  // Side effect here
  return () => {
    // Cleanup
  };
}, [dependencies]);
```
**Interview Answer:** "Runs side effects after render. Dependencies array controls when it runs. Cleanup function prevents memory leaks - runs before unmount or before next effect."

### 3. useContext
```javascript
const value = useContext(MyContext);
```
**Interview Answer:** "Accesses Context value without prop drilling. Must be used within a Provider. Component re-renders when context value changes."

### 4. useRef
```javascript
const ref = useRef(initialValue);
```
**Interview Answer:** "Creates mutable object that persists across renders. Two uses: DOM access and storing mutable values that don't trigger re-renders."

### 5. useMemo
```javascript
const memoizedValue = useMemo(() => expensiveCalc(a, b), [a, b]);
```
**Interview Answer:** "Caches expensive calculation results. Only recomputes when dependencies change. Use for performance optimization, not as semantic guarantee."

### 6. useCallback
```javascript
const memoizedCallback = useCallback(() => { doSomething(a, b); }, [a, b]);
```
**Interview Answer:** "Caches function reference. Prevents unnecessary child re-renders when passing callbacks to memoized components."

### 7. useReducer
```javascript
const [state, dispatch] = useReducer(reducer, initialState);
```
**Interview Answer:** "Alternative to useState for complex state logic. Useful when state depends on previous state or multiple sub-values. Similar to Redux pattern."

### 8. useLayoutEffect
```javascript
useLayoutEffect(() => {
  // Runs synchronously after DOM mutations
}, [dependencies]);
```
**Interview Answer:** "Like useEffect but fires synchronously before browser paint. Use for DOM measurements. 99% of time use useEffect instead."

### 9. useTransition (React 18+)
```javascript
const [isPending, startTransition] = useTransition();
```
**Interview Answer:** "Marks state updates as non-urgent. Allows React to keep UI responsive during expensive updates. Part of Concurrent React."

### 10. Custom Hooks
```javascript
function useCustomHook() {
  const [state, setState] = useState();
  // Logic here
  return [state, setState];
}
```
**Interview Answer:** "Reusable stateful logic. Name starts with 'use'. Can call other hooks. Replaced HOCs and Render Props for most use cases."

---

## 🎯 Top 20 Interview Questions & Rapid Answers

### 1. What is Virtual DOM?
**Answer:** "In-memory representation of UI. React compares it with previous version (reconciliation), calculates minimal changes, then efficiently updates Real DOM."

### 2. Difference between class and functional components?
**Answer:** "Functional components use hooks for state/lifecycle. Simpler syntax, better performance. Class components use this.state and lifecycle methods. Functional is modern standard."

### 3. What are keys in React lists?
**Answer:** "Unique identifiers helping React track which items changed/added/removed during reconciliation. Should be stable IDs, not array indices. Improves performance."

### 4. Controlled vs Uncontrolled components?
**Answer:** "Controlled: React state is source of truth (value + onChange). Uncontrolled: DOM is source of truth (use refs). Controlled gives more control and validation."

### 5. When to use useCallback vs useMemo?
**Answer:** "useCallback for memoizing functions, useMemo for values. Use useCallback when passing functions to memoized child components to prevent re-renders."

### 6. What is prop drilling?
**Answer:** "Passing props through multiple component levels to reach deeply nested child. Solutions: Context API, state management libraries, component composition."

### 7. Redux vs Context API?
**Answer:** "Context built-in, simple for theme/auth. Redux adds middleware, DevTools, time-travel debugging, better for complex apps with many actions and state updates."

### 8. What is useEffect cleanup function?
**Answer:** "Function returned from useEffect. Runs before component unmounts or before effect re-runs. Used to unsubscribe, cancel timers, abort requests - prevents memory leaks."

### 9. Difference between useEffect and useLayoutEffect?
**Answer:** "useEffect runs asynchronously after paint. useLayoutEffect runs synchronously before paint. Use useLayoutEffect only for DOM measurements."

### 10. What is React.memo?
**Answer:** "Higher-order component that memoizes component. Re-renders only if props change (shallow comparison). Performance optimization for expensive components."

### 11. Server Components vs Client Components?
**Answer:** "Server Components render on server, reduce bundle size, can access backend directly. Client Components render in browser, need 'use client' directive, have interactivity."

### 12. What is Concurrent React?
**Answer:** "React 18+ feature allowing React to work on multiple state updates simultaneously. Enables useTransition, useDeferredValue for keeping UI responsive during expensive updates."

### 13. Suspense for data fetching?
**Answer:** "Declarative way to handle async operations. Component suspends rendering while waiting for data. Shows fallback UI. Used with React.lazy and emerging data fetching libraries."

### 14. React Query vs Redux?
**Answer:** "React Query for SERVER state (API data, caching, refetching). Redux for CLIENT state (UI state, user preferences). Different problems, often used together."

### 15. What is reconciliation?
**Answer:** "Algorithm React uses to diff Virtual DOM trees. Determines minimal changes needed to update Real DOM. Uses keys and component type to optimize."

### 16. Error boundaries?
**Answer:** "Components catching JavaScript errors in child tree. Use componentDidCatch or static getDerivedStateFromError. Displays fallback UI. Doesn't catch async errors or event handlers."

### 17. Portals use cases?
**Answer:** "Render children into DOM node outside parent hierarchy. Use for modals, tooltips, dropdowns. ReactDOM.createPortal(child, domNode)."

### 18. StrictMode benefits?
**Answer:** "Development-only tool highlighting potential problems. Double-invokes effects to find side effects. Warns about deprecated APIs. Helps prepare for Concurrent Mode."

### 19. Code splitting strategies?
**Answer:** "React.lazy for component-level. Dynamic import() for modules. Route-based splitting is most common. Reduces initial bundle size."

### 20. HOC vs Render Props vs Hooks?
**Answer:** "All solve code reuse. HOC wraps components. Render Props passes function as child. Hooks are modern solution - simpler, more composable. Use hooks for new code."

---

## 🧠 Memory Mnemonics

### All Hooks (Order by frequency of use)
**"Some Eggs Cook Really Mighty, Like Italian Tacos, Carefully"**
- **S**tate, **E**ffect, **C**ontext, **R**ef, **M**emo, **L**ayout, **I**mperativeHandle, **T**ransition, **C**allback

### Patterns
**"Harry's Render Props Can Provide Creative Compositions"**
- **H**OC, **R**ender Props, **C**ompound, **P**rovider, **C**ontainer/Presentational, **C**omposition

### Performance
**"My Lazy Cat Virtually Dances Ballet"**
- **M**emo, **L**azy, **C**oncurrent, **V**irtualize, **D**ebounce, **B**undle

### State Management Decision
**"Local Children Go Server-side"**
- **Local** state → **C**ontext (children) → **G**lobal → **S**erver state

---

## ⚡ Performance Optimization Checklist

### When Component Re-renders Too Often
```
1. Check: Is parent re-rendering unnecessarily?
2. Wrap with React.memo
3. Use useCallback for function props
4. Use useMemo for computed values passed as props
```

### When Bundle Size is Large
```
1. Analyze with webpack-bundle-analyzer
2. Implement route-based code splitting
3. Use React.lazy + Suspense
4. Tree shake unused dependencies
5. Consider dynamic imports
```

### When List Rendering is Slow
```
1. Check: Is list >100 items?
2. Implement virtualization (react-window)
3. Use proper keys (stable IDs, not indices)
4. Memoize list items if complex
```

### When Input Has Lag
```
1. Debounce onChange handler
2. Use useTransition for non-urgent updates
3. Consider useDeferredValue for derived state
```

---

## 🎨 Common Patterns Quick Reference

### Custom Hook Pattern
```javascript
function useLocalStorage(key, initialValue) {
  const [storedValue, setStoredValue] = useState(() => {
    return localStorage.getItem(key) || initialValue;
  });
  
  const setValue = (value) => {
    setStoredValue(value);
    localStorage.setItem(key, value);
  };
  
  return [storedValue, setValue];
}
```

### Compound Component Pattern
```javascript
function Select({ children, value, onChange }) {
  return <div>{children}</div>;
}

Select.Option = function Option({ value, children }) {
  return <div>{children}</div>;
};

// Usage: <Select><Select.Option>A</Select.Option></Select>
```

### Provider Pattern
```javascript
const ThemeContext = createContext();

function ThemeProvider({ children }) {
  const [theme, setTheme] = useState('light');
  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      {children}
    </ThemeContext.Provider>
  );
}
```

---

## 🚨 Red Flags in Interviews

### Don't Say:
❌ "I use useEffect for all side effects" (too vague)  
❌ "Keys don't matter much" (shows lack of understanding)  
❌ "Redux is always better than Context" (no nuance)  
❌ "I optimize everything" (premature optimization)  
❌ "Class components are better" (outdated)  

### Do Say:
✅ "I use useEffect for subscriptions, API calls, and DOM manipulation"  
✅ "Keys enable efficient reconciliation by helping React track identity"  
✅ "I choose Redux for complex state with middleware needs, Context for simpler cases"  
✅ "I measure performance first, then optimize bottlenecks"  
✅ "Functional components with hooks are the modern standard"  

---

## 💎 Bonus: Show Deep Understanding

### When Asked About Hooks
"Hooks let us use state and other React features without classes. They follow two rules: only call at top level, only call from React functions. This enables React to preserve state between renders using a linked list internally."

### When Asked About Virtual DOM
"React's Virtual DOM is a performance optimization. It batches DOM updates and uses a diffing algorithm. In React 18, Concurrent features can pause, resume, or abandon renders, making the Virtual DOM even more powerful."

### When Asked About State Management
"I categorize state into four types: local (useState), shared nearby (Context), global client (Redux/Zustand), and server (React Query). Each has its place. The evolution is recognizing server state is fundamentally different from client state."

---

## 📊 Interview Scoring Rubric (What They Look For)

### Junior (0-2 years)
- [ ] Understands basic hooks (useState, useEffect)
- [ ] Can explain Virtual DOM at high level
- [ ] Knows when to lift state up
- [ ] Understands component props and state

### Mid-Level (2-5 years)
- [ ] Uses custom hooks effectively
- [ ] Understands performance optimization
- [ ] Knows multiple state management solutions
- [ ] Can debug with React DevTools
- [ ] Understands reconciliation process

### Senior (5+ years)
- [ ] Explains tradeoffs between patterns
- [ ] Designs component architecture
- [ ] Knows internals (fiber, reconciliation algorithm)
- [ ] Stays current with React evolution
- [ ] Can mentor others on best practices

---

## 🎯 Last-Minute Review (30 min before interview)

### Minute 0-10: Hooks
- Recite: "useState, useEffect, useContext, useRef, useMemo, useCallback"
- Practice explaining each in one sentence

### Minute 10-20: Patterns & Performance
- Review: When to use Context vs Redux
- Recall: React.memo, code splitting, virtualization

### Minute 20-30: Your Projects
- Pick 3 technical challenges you solved
- Prepare to explain: problem, solution, why that approach

---

**Print this sheet. Keep it handy. Review before interviews. Good luck! 🚀**
